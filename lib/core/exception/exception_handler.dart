import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'api_exception.dart';

part 'exception_handler.g.dart';

@Riverpod(keepAlive: true)
ExceptionHandler exceptionHandler(Ref ref) {
  return ExceptionHandler();
}

class ExceptionHandler {
  AppException call(Object? error) {
    if (error is AppException) return error;

    if (error == null) {
      return AppException('Something went wrong.', code: 'unknown');
    }

    // --- Supabase Specific Exceptions ---
    if (error is PostgrestException) return _handleSupabasePostgrest(error);
    if (error is AuthException) return _handleSupabaseAuth(error);

    // --- Dio Network Exceptions ---
    if (error is DioException) return _handleDio(error);

    // --- Standard Dart/Flutter Exceptions ---
    if (error is SocketException) {
      return AppException(
        'Please check your internet connection.',
        code: 'no_connection',
      );
    }
    if (error is TimeoutException) {
      return AppException(
        'The request timed out. Please try again.',
        code: 'timeout',
      );
    }
    if (error is FormatException) {
      return AppException(
        'There was a problem processing data.',
        code: 'format_error',
      );
    }

    // --- Fallbacks ---
    if (error is Exception) {
      // return AppException('An unexpected error occurred.', code: 'unexpected');
      return AppException('Check your network connection.', code: 'unexpected');
    }

    // For non-exception throwables (e.g., Error)
    return AppException('An unknown error occurred.', code: 'unknown');
  }

  // --- Private Handler Methods ---
  AppException _handleSupabasePostgrest(PostgrestException e) {
    final msg = e.message.toLowerCase();

    // UPDATED: Added 'failed to fetch' and 'connection refused'
    if (msg.contains('network request failed') ||
        msg.contains('failed host lookup') ||
        msg.contains('failed to fetch') ||
        msg.contains('connection refused')) {
      return AppException(
        'Please check your internet connection.',
        code: 'no_connection',
      );
    }

    switch (e.code) {
      case '23505':
        return AppException('This item already exists.', code: 'db_conflict');
      case '23503':
        return AppException(
          "Can't delete this item as it's related to other data.",
          code: 'db_related_item',
        );
      case '23502':
        return AppException(
          'Please fill in all required fields.',
          code: 'db_missing_field',
        );
      case '42501':
        return AppException(
          "You don't have permission to do this.",
          code: 'db_permission_denied',
        );
      default:
        final cleanMsg = e.message.trim();
        return AppException(
          cleanMsg.isNotEmpty
              ? cleanMsg
              : 'A database error occurred. Please try again later.',
          code: e.code ?? 'db_error', // Use the code if available
        );
    }
  }

  AppException _handleSupabaseAuth(AuthException e) {
    final msg = e.message.toLowerCase();

    // UPDATED: Added 'failed to fetch' and 'connection refused'
    if (msg.contains('network request failed') ||
        msg.contains('failed host lookup') ||
        msg.contains('failed to fetch') ||
        msg.contains('connection refused')) {
      return AppException(
        'Please check your internet connection.',
        code: 'no_connection',
      );
    }

    // Handle common auth messages with user-friendly text
    if (msg.contains('invalid login credentials')) {
      return AppException(
        'Incorrect email or password. Please try again.',
        code: 'auth_invalid_credentials',
      );
    }
    if (msg.contains('user already registered')) {
      return AppException(
        'An account with this email already exists.',
        code: 'auth_email_exists',
      );
    }
    if (msg.contains('email not confirmed')) {
      return AppException(
        'Please check your inbox and confirm your email address.',
        code: 'auth_email_not_confirmed',
      );
    }
    if (msg.contains('user banned') || msg.contains('user is disabled')) {
      return AppException(
        'Your account has been banned. Please contact support.',
        code: 'auth_user_banned',
      );
    }
    if (msg.contains('invalid refresh token')) {
      return AppException(
        'Your session has expired. Please log in again.',
        code: 'auth_session_expired',
      );
    }
    if (msg.contains('password should be at least')) {
      return AppException(
        'Password must be at least 6 characters long.',
        code: 'auth_weak_password',
      );
    }
    if (msg.contains('unable to validate email address')) {
      return AppException(
        'Please enter a valid email address.',
        code: 'auth_invalid_email',
      );
    }
    if (msg.contains('email change rate limit exceeded') ||
        msg.contains('password recovery rate limit exceeded')) {
      return AppException(
        'Too many requests. Please wait a few minutes and try again.',
        code: 'auth_rate_limit',
      );
    }
    if (msg.contains('rate limit exceeded')) {
      return AppException(
        'Too many requests. Please try again later.',
        code: 'auth_rate_limit',
      );
    }

    // Fallback for other auth errors
    return AppException(e.message, code: e.statusCode ?? 'auth_error');
  }

  AppException _handleDio(DioException ex) {
    switch (ex.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException(
          'The request timed out. Please try again.',
          code: 'timeout',
        );

      case DioExceptionType.badResponse:
        final status = ex.response?.statusCode;
        final serverMessage = _extractServerMessage(ex.response?.data);

        if (status != null && status >= 500) {
          return AppException(
            serverMessage.isNotEmpty
                ? serverMessage
                : 'Server error. Please try again later.',
            code: 'server_error',
          );
        }
        if (status == 401 || status == 403) {
          return AppException(
            serverMessage.isNotEmpty
                ? serverMessage
                : 'Unauthorized. Please log in again.',
            code: 'unauthorized',
          );
        }
        if (status == 404) {
          return AppException(
            'The requested resource was not found.',
            code: 'not_found',
          );
        }
        return AppException(
          serverMessage.isNotEmpty
              ? serverMessage
              : 'A request error occurred. Please try again.',
          code: 'request_error',
        );

      case DioExceptionType.connectionError:
        return AppException(
          'Please check your internet connection.',
          code: 'no_connection',
        );

      case DioExceptionType.cancel:
        return AppException('The request was cancelled.', code: 'cancelled');

      case DioExceptionType.unknown:
      default:
        if (ex.error is SocketException) {
          return AppException(
            'Please check your internet connection.',
            code: 'no_connection',
          );
        }
        final msg = ex.message;
        if (msg != null && msg.isNotEmpty) {
          return AppException(msg, code: 'network_error');
        }
        return AppException(
          'An unexpected network error occurred.',
          code: 'network_error',
        );
    }
  }

  /// Extract a readable error message from a server response body.
  /// Handles common JSON structures like:
  /// { "message": "Error details" }
  /// { "error": "Error details" }
  /// { "errors": ["Error 1", "Error 2"] }
  /// { "errors": { "field": ["Error 1"] } }
  String _extractServerMessage(Object? data) {
    if (data == null) return '';

    try {
      if (data is Map) {
        // { "message": "..." }
        if (data.containsKey('message') && data['message'] is String) {
          return data['message'] as String;
        }
        // { "error": "..." }
        if (data.containsKey('error') && data['error'] is String) {
          return data['error'] as String;
        }
        // { "errors": { "field": ["..."] } } (e.g., validation errors)
        if (data.containsKey('errors') && data['errors'] is Map) {
          final errors = data['errors'] as Map;
          // Just grab the first error message
          if (errors.isNotEmpty) {
            final firstErrorList = errors.values.first;
            if (firstErrorList is List && firstErrorList.isNotEmpty) {
              return firstErrorList.first as String;
            }
          }
        }
        // { "errors": ["..."] }
        if (data.containsKey('errors') && data['errors'] is List) {
          final errors = data['errors'] as List;
          if (errors.isNotEmpty && errors.first is String) {
            return errors.first as String;
          }
        }
      }

      // Handle data being a JSON string
      if (data is String) {
        final jsonData = jsonDecode(data);
        // Recursively call with the parsed data
        return _extractServerMessage(jsonData);
      }
    } catch (_) {
      // If parsing fails, just return an empty string
      return '';
    }

    return '';
  }
}
