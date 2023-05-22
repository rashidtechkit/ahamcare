import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class OtpServices {
  Dio dio = Dio();
  Future<String?> sendOtp(phone, context) async {
    log('otp enabled');
    try {
      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndpoints.sendOtp,
        queryParameters: {"phone_no": phone},
      );
      log("entered if");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp created');
        log('otp done');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log('otp failed');
      DioException().dioError(e, context);
    }
    return null;
  }
}
