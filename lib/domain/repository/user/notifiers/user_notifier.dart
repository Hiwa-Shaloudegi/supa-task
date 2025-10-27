import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/domain/mapper/user_mapper.dart';
import 'package:supa_task/domain/models/app_user.dart';
import 'package:supa_task/domain/repository/user/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  AppUser? build() {
    final userRepo = ref.read(userRepositoryProvider);

    state = userRepo.currentUser;

    userRepo.onAuthStateChange().listen((data) {
      switch (data.event) {
        case AuthChangeEvent.signedIn:
          state = data.session?.user.toAppUser();
          break;
        case AuthChangeEvent.signedOut:
          state = null;
          break;
        default:
          state = userRepo.currentUser;
      }
    });

    return state;
  }
}
