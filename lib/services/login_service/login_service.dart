import 'dart:convert';
import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/login_model/login_model.dart';
import 'package:ahamcare/model/login_model/login_token_model.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginService {
  Dio dio = Dio();
  
  Future<LoginTokenModel?> logInService(
      LoginModel model, BuildContext context) async {
    try {
      final Response response = await dio.post(
        //'http://192.168.1.4:4000/api/v1/auth/login',
        ApiBaseUrl.baseUrl + ApiEndpoints.logIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      log("message");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final model = LoginTokenModel.fromJson(response.data);
        log(response.data.toString());
        return model;
      }
    } on DioError catch (e) {
      log(e.response.toString());
      log(e.response.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
