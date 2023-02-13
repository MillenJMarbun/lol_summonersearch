import 'package:dio/dio.dart';

class ExceptionEntity {
  int? code;
  String? errorMessage;
  String? errorDescription;

  ExceptionEntity({
    required this.code,
    required this.errorMessage,
    required this.errorDescription,
  });

  factory ExceptionEntity.fromFAILContent(Map<String, dynamic> response) =>
      ExceptionEntity(
        code: 0,
        errorMessage: response['errorMessage'],
        errorDescription: response['errorDescription'],
      );

  factory ExceptionEntity.fromDioError(DioError dioError) => ExceptionEntity(
        code: dioError.response!.statusCode ?? 0,
        errorMessage: dioError.response!.statusMessage.toString(),
        errorDescription: dioError.response!.data is String
            ? 'Server Down'
            : dioError.response!.data['message'],
      );
}
