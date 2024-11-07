import 'package:dio/dio.dart';

class PostCreateNewUserModel {
  final String name;
  final String email;
  final String mobileNo;
  final String password;


  PostCreateNewUserModel({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.password,
  });

  // Converts model data to FormData for HTTP requests
  Future<FormData> toFormData() async {
    return FormData.fromMap(<String, dynamic>{
      'name': name,
      'email': email,
      'mobile_no': mobileNo,
      'password': password,
    });
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile_no': mobileNo,
      'password': password,
    };
  }
  // Custom toString method for easy logging
  @override
  String toString() {
    return 'PostCreateNewUserModel(name: $name, email: $email, mobileNo: $mobileNo, password: $password,)';
  }
}
