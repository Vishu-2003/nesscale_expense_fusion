import 'dart:io';

import 'package:dio/dio.dart';

import '../interceptors/api_interceptor.dart';

class DioX {
  DioX._();

  factory DioX() => _internal;
  static final DioX _internal = DioX._();


  Dio _dio(String baseurl) => Dio(
      BaseOptions(
        baseUrl: baseurl,
        contentType: ContentType.json.mimeType,
        validateStatus: (status)=> status == 200,
      )
  );

  Dio getDio(String baseurl){
    final interceptor=[
      ApiInterceptor(),
      LoggingInterceptor()
    ];
    return _dio(baseurl)..interceptors.addAll(interceptor);
  }
}