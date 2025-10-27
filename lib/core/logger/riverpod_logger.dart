import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final class RiverpodLogger extends ProviderObserver {
  final _logger = Logger();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    _safeLog(() {
      _logger.i(
        '\tADDED: ${_providerName(context.provider)}\n'
        '\tvalue: $value',
      );
    });
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    _safeLog(() {
      _logger.w('\t DISPOSED: ${_providerName(context.provider)}');
    });
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    _safeLog(() {
      _logger.e(
        'FAILED: ${_providerName(context.provider)}',
        error: error,
        stackTrace: stackTrace,
      );
    });
  }

  String _providerName(ProviderOrFamily provider) {
    return provider.name ?? provider.runtimeType.toString();
  }

  // Safe logging wrapper
  void _safeLog(void Function() logAction) {
    try {
      // Schedule logging to avoid engine assertions
      if (kDebugMode) {
        scheduleMicrotask(logAction);
      }
    } catch (e) {
      // Silently ignore logging errors
    }
  }
}
