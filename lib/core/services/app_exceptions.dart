part of 'base_services.dart';


class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class BadResponseException extends AppException {
  BadResponseException([String? message]) : super(message, "Bad Response: ");
}

class OtherDioException extends AppException {
  OtherDioException([String? message]) : super(message, "Other Dio Exception: ");
}

AppException getErrorMessageForDioErrors(DioException err) {
  switch (err.response?.statusCode) {
    case 417:
      return BadResponseException("you are not enter require value  !");
    case _:
      return BadResponseException(
        err.response?.data['message'] ?? err.response?.data['exception'] ?? err.message,
      );
  }
}
