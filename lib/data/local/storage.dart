import 'package:native_storage/native_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage.g.dart';

@Riverpod(keepAlive: true)
NativeStorage storage(Ref ref) {
  return NativeStorage();
}
