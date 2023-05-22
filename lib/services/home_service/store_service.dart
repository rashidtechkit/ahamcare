import 'dart:developer';

import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/home_model/store_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class StoreService {
  Future<List<StoreModel>?> getStore(context) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl.baseUrl + ApiEndpoints.store,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<StoreModel> model = (response.data['stores'] as List)
            .map((e) => StoreModel.fromJson(e))
            .toList();
        log(model.toString());
        return model;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
