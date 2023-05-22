import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/home_model/get_all_details_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class GetAllDetailsService {
  Future<AllDetailsModel?> getAllDetailsService(context, String id) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        "${ApiBaseUrl.baseUrl + ApiEndpoints.getAllDetails}/$id",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final AllDetailsModel model =
            AllDetailsModel.fromJson(response.data["organization"]);
        log(model.toString());
        log(response.data.toString());
        return model;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }

  // Future<List<AllDetailsModel>?> getAllDetailsService(
  //     context, String id) async {
  //   final Dio dios = await ApiInterceptor().getApiUser(context);
  //   try {
  //     final Response response = await dios.get(
  //       "${ApiBaseUrl.baseUrl + ApiEndpoints.getAllDetails}/$id",
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log(response.statusCode.toString());
  //       final List<AllDetailsModel> model = (response.data as List)
  //           .map((e) => AllDetailsModel.fromJson(e))
  //           .toList();
  //       log(model.toString());
  //       log(response.data.toString());
  //       return model;
  //     }
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     DioException().dioError(e, context);
  //   }
  //   return null;
  // }
}
