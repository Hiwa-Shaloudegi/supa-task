import 'package:native_storage/native_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/data/local/storage.dart';
import 'package:supa_task/data/local/storage_constants.dart';

part 'theme_local_service.g.dart';

@Riverpod(keepAlive: true)
ThemeLocalService themeLocalService(Ref ref) {
  return ThemeLocalService(storage: ref.read(storageProvider));
}

class ThemeLocalService {
  final NativeStorage storage;

  ThemeLocalService({required this.storage});

  void saveTheme(String theme) {
    storage.write(StorageConstants.themeMode, theme);
  }

  String? getTheme() {
    return storage.read(StorageConstants.themeMode);
  }
}
