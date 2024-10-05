import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final int code;

  const ErrorMessageModel({required this.message, required this.code});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json['message'],
      code: json['code'],
    );
  }

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}
