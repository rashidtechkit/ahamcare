import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/home_model/event_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class EventService {
  Future<List<EventModel>?> getEvent(context) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        ApiBaseUrl.baseUrl + ApiEndpoints.event,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<EventModel> model =
            (response.data as List).map((e) => EventModel.fromJson(e)).toList();
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
