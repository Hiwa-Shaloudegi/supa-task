import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/data/api/auth/auth_api_service.dart';
import 'package:supa_task/domain/mapper/user_mapper.dart';
import 'package:supa_task/domain/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepository(authApiService: ref.read(authApiServiceProvider));
}

class UserRepository {
  final AuthApiService _authApiService;

  UserRepository({required AuthApiService authApiService})
    : _authApiService = authApiService;

  AppUser? get currentUser => _authApiService.currentUser?.toAppUser();

  Stream<AuthState> onAuthStateChange() {
    return _authApiService.onAuthStateChange();
  }

  Future<AuthResponse> signup(
    String email,
    String password,
    String name,
  ) async {
    return _authApiService.signup(email, password, name);
  }

  Future<AuthResponse> login(String email, String password) async {
    return await _authApiService.login(email, password);
  }

  Future<void> logout() async {
    await _authApiService.logout();
  }

  Future<AuthResponse> googleSignIn() async {
    return await _authApiService.googleSignIn();
  }
}
