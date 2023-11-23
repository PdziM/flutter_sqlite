import 'dart:io';

class CustomException {
  final String message;
  final HttpStatus? status;

  CustomException(this.message, {this.status});

  @override
  String toString() => 'CustomException(message: $message, status: $status)';
}
