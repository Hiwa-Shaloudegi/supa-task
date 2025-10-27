import 'package:supa_task/domain/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension UserMapper on User {
  AppUser toAppUser() {
    return AppUser(
      id: id,
      email: email,
      phone: phone,
      name: userMetadata?['name'] as String?,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
