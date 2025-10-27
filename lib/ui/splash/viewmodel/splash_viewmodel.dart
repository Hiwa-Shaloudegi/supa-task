import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supa_task/ui/splash/viewmodel/splash_uistate.dart';

part 'splash_viewmodel.g.dart';

@riverpod
class SplashViewmodel extends _$SplashViewmodel {
  @override
  SplashUiState build() {
    return SplashUiState();
  }
}
