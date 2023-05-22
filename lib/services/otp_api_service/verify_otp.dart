import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class VerifyOtpService {
  Dio dio = Dio();
  Future<String?> verifyOtp(phone, otpCode, context) async {
    try {
      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndpoints.verifyOtp,
        queryParameters: {
          'phone_no': phone,
          'otp': otpCode,
        },
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp verified');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log('verification faliled');
      DioException().dioError(e, context);
    }
    return null;
  }
}
