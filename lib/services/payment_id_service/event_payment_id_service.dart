import 'dart:developer';

import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/payment_model/payment_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class EventPaymentIdService {
  Future<EventPaymentmodel?> paymentId(
      storeId, context, paymentId, count) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.post(
          ApiBaseUrl.baseUrl + ApiEndpoints.paymentId,
          data: {"storeId": storeId, "count": count, "paymentId": paymentId});
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          log('paymentId');
          return response.data;
          // ['message'];
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
