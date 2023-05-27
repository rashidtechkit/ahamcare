import 'dart:convert';

import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/model/social_model/post_social_page.dart';
import 'package:ahamcare/utils/dio_interceptor/interceptor.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class PostService {
  Future<String?> toPost(PostSocialModel model, context) async {
    try {
      Dio dio = await ApiInterceptor().getApiUser(context);

      List<int> imageBytes = await model.photo.readAsBytes();
      String baseImage = base64Encode(imageBytes);

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndpoints.post,
        data: {
          "photo": baseImage.toString(),
          "description": model.description,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        final postResponse = response.data['message'];
        print(response.data.toString());
        return postResponse;
      } else {
        print('Image upload failed with status ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('Error uploading image: ${e.response?.statusCode}');
      DioException().dioError(e, context);
    } catch (e) {
      print('Error uploading image: $e');
    }
    return null;
  }
}
