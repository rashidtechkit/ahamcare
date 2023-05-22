import 'dart:convert';
import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/social_model/like_post_model.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class LikePostService {
  Future<String?> toPost(LikePostModel model, context) async {
    Dio dios = await ApiInterceptor().getApiUser(context);
    try {
      final Response response = await dios.post(
        ApiBaseUrl.baseUrl + ApiEndpoints.post,
        data: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final postResponse = response.data['message'];
          return postResponse;
        }
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e, context);
    }
    return null;
  }
}
