import 'dart:developer';

import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/profile_model/profile_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class ProfileService {
  Future<ProfileModel?> profileService(context) async {
    final Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.get(
        "${ApiBaseUrl.baseUrl + ApiEndpoints.profile}",
        // /$id
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<ProfileModel> modelList =
              responseData.map((e) => ProfileModel.fromJson(e)).toList();
          log(modelList.toString());
          return modelList.isNotEmpty ? modelList.first : null;
        } else if (responseData is Map<String, dynamic>) {
          final ProfileModel model = ProfileModel.fromJson(responseData);
          log(model.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
