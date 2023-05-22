import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/home_model/get_all_oraganizations.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class GetAllOrganizationService {
  Future<List<GetAllOrganizationsModel>?> getOrganizationService(
      context, String id) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        "${ApiBaseUrl.baseUrl + ApiEndpoints.getAllOrganizations}/$id",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final List<GetAllOrganizationsModel> model =
            (response.data['organization'] as List)
                .map((e) => GetAllOrganizationsModel.fromJson(e))
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
