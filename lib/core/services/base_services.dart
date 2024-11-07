import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/constants.dart';
import '/core/services/helpers.dart';
part 'app_exceptions.dart';


mixin BaseServices{
   final String apiVersion = '.v1';
   Dio dio = DioX().getDio(baseurl);

   void setBaseUrl(String baseUrl) {
      dio = DioX().getDio(baseUrl);
   }
   final Map<String, dynamic> requiresToken = {"requiresToken": true};
   Future<T> tryOrCatch<T>(Future<T> Function() methodToRun) async {
     try {
       return await methodToRun();
     } on AppException {
       rethrow;
     } on DioException catch (err) {
       throw getErrorMessageForDioErrors(err);
     } catch (e, trace) {
       debugPrint("$e\n$trace");
       throw AppException(
         "Internal Error occurred, please try again later !",
         "Default Exception: ",
       );
     }
   }
   }

