import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_interceptors.dart';

class ApiInterceptor implements Interceptor{
  ApiInterceptor._();
  factory ApiInterceptor() => _instance;
  static final ApiInterceptor _instance = ApiInterceptor._();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
       return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
       _attachAuthToken(options);
       return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
       return handler.next(response);
  }
  void _attachAuthToken(RequestOptions options) async {
    if (!options.extra.containsKey("requiresToken") || !options.extra['requiresToken']) return;
    options.extra.remove("requiresToken");
    final SharedPreferences preferences= await SharedPreferences.getInstance();
    final String? apikey=preferences.getString('apikey');
    final String? apiSecret=preferences.getString('apiSecret');
    options.headers.addAll({"Authorization": 'token $apikey:$apiSecret'});
  }

}