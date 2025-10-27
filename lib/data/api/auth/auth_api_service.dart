import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/core/exception/exception_handler.dart';
import 'package:supa_task/data/api/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_api_service.g.dart';

@Riverpod(keepAlive: true)
AuthApiService authApiService(Ref ref) {
  return AuthApiService(
    supabase: ref.read(supabaseProvider),
    handleException: ref.read(exceptionHandlerProvider),
  );
}

class AuthApiService {
  final SupabaseClient supabase;
  final ExceptionHandler handleException;

  AuthApiService({required this.supabase, required this.handleException});

  User? get currentUser => supabase.auth.currentUser;

  Stream<AuthState> onAuthStateChange() {
    return supabase.auth.onAuthStateChange;
  }

  Future<AuthResponse> signup(
    String email,
    String password,
    String name,
  ) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      return res;
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return res;
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<AuthResponse> googleSignIn() async {
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? '';
    final iosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? '';

    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    if (kIsWeb) {
      await googleSignIn.initialize(clientId: webClientId);
    } else {
      await googleSignIn.initialize(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
    }
    try {
      if (kIsWeb) {
        return await _googleSignInWeb();
      } else {
        return await _googleSignInMobile();
      }
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<AuthResponse> _googleSignInWeb() async {
    final response = await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo:
          kIsWeb
              ? 'http://localhost:7357/auth/callback'
              : 'io.supabase.flutterquickstart://login-callback/',
      authScreenLaunchMode: LaunchMode.externalApplication,
      // kIsWeb
      // ? LaunchMode.platformDefault
      // : LaunchMode
      //     .externalApplication, // Launch the auth screen in a new webview on mobile.
    );

    if (!response) {
      throw Exception('Google Sign-In was cancelled or failed');
    }

    final authState = await supabase.auth.onAuthStateChange.firstWhere(
      (state) => state.session != null,
    );

    return AuthResponse(
      session: authState.session,
      user: authState.session?.user,
    );
  }

  Future<AuthResponse> _googleSignInMobile() async {
    final googleSignIn = GoogleSignIn.instance;

    final googleAccount = await googleSignIn.authenticate();

    final googleAuthorization = await googleAccount.authorizationClient
        .authorizationForScopes([]);

    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = googleAuthorization?.accessToken;

    if (accessToken == null) {
      throw Exception('No Access Token found.');
    }
    if (idToken == null) {
      throw Exception('No ID Token found.');
    }

    return await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
