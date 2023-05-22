import 'dart:convert';
import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/map_model/map_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class MapService {
  Future<List<MarkerModel>?> getLocation(MarkerModel model, context) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      log(model.toString());

      final Response response = await dios.post(
        ApiBaseUrl.baseUrl + ApiEndpoints.map,
        data: jsonEncode(
          model.toJson(),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('map verified');
        log(response.statusCode.toString());
        log(response.data.toString());
        final List<MarkerModel> map = (response.data as List)
            .map((e) => MarkerModel.fromJson(e))
            .toList();
        log(
          map.toString(),
        );
        return map;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log('map faliled');
      DioException().dioError(e, context);
    }
    return null;
  }
}
