import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/home_model/home_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class HomeService {
  Future<List<HomeModel>?> getHomeService(context) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl.baseUrl + ApiEndpoints.allDivision,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final List<HomeModel> model =
            (response.data as List)
                .map((e) => HomeModel.fromJson(e))
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
