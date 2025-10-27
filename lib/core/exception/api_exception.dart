class AppException implements Exception {
  final String message;
  final String? code;
  final String? statusCode;

  AppException(this.message, {this.code, this.statusCode});

  @override
  String toString() =>
      'AppException(code: $code, statusCode: $statusCode, message: $message)';
}
