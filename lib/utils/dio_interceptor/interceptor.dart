import 'dart:developer';
import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/api/api_endpoints.dart';
import 'package:ahamcare/utils/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<Dio> getApiUser(context) async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'token');
          dio.interceptors.clear();
          options.headers.addAll({"Authorization": "Bearer $token"});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 401 &&
                e.response?.data['error'] == 'Access token expired') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              try {
                await regenerateToken();
                // final refreshToken = await storage.read(key: 'refreshToken');
                // log(refreshToken.toString());
                // final opts = Options(method: requestOptions.method);
                // dio.options.headers["refresh"] = "Bearer $refreshToken";
                // final Response response = await dio.get(
                //   ApiBaseUrl().baseUrl + ApiEndpoints.refreshToken,
                //   options: opts,
                // );

                // if (response.statusCode! == 200) {
                //   log(response.data.toString());
                //   final token = response.data['accessToken'];
                //   // final refreshToken = response.data['refreshToken'];
                //   await storage.delete(key: 'token');
                //   // await storage.delete(key: 'refreshToken');
                //   storage.write(key: 'token', value: token);
                //   // storage.write(key: 'refreshToken', value: refreshToken);
                // }
              } catch (e) {
                DioException().dioError(e, context);
              }
              try {
                final token = await storage.read(key: 'token');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["Authorization"] = "Bearer $token";
                final response = await dio.request(
                  requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                DioException().dioError(e, context);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }

  static regenerateToken() async {
    Response response;
    FlutterSecureStorage storage = const FlutterSecureStorage();
    var dio = Dio();
    final Uri apiUrl = Uri.parse(
      ApiBaseUrl.baseUrl + ApiEndpoints.refreshToken,
    );
    var refreshToken = await storage.read(key: 'refreshToken');
    // dio.options.headers["Authorization"] = "Bearer " + refreshToken;
    try {
      response =
          await dio.postUri(apiUrl, data: {'refreshToken': refreshToken});
      if (response.statusCode == 200) {
        storage.write(key: 'token', value: response.data["accessToken"]);
      } else {
        log(response.toString()); //TODO: logout
      }
    } catch (e) {
      log(e.toString()); //TODO: logout
    }
  }
}




// class ApiInterceptor {
//   FlutterSecureStorage storage = const FlutterSecureStorage();
//   Dio dio = Dio();

//   Future<Dio> getApiUser(context) async {
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final token = await storage.read(key: 'token');
//           dio.interceptors.clear();
//           options.headers.addAll({"Authorization": "Bearer $token"});
//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           return handler.next(response);
//         },
//         onError: (DioError e, handler) async {
//           if (e.response != null) {
//             if (e.response?.statusCode == 401 &&
//                 e.response?.data['error'] == "Access token expired") {
//               log('token expired');
//               RequestOptions requestOptions = e.requestOptions;
//               try {
//                 final refreshToken = await storage.read(key: 'refreshToken');
//                 Map<String, dynamic> data = {"refreshToken": refreshToken};
//                 log(refreshToken.toString());
//                 final opts = Options(method: requestOptions.method);
//                 dio.options.headers["refresh"] = "Bearer $refreshToken";
//                 final Response response = await dio.post(
//                   '${ApiBaseUrl.baseUrl}${ApiEndpoints.refreshToken}?refreshToken=$refreshToken',
//                   data: data,
//                   options: opts,
//                 );
//                 log(response.data.toString());
//                 if (response.statusCode! == 200) {
//                   log(response.data.toString());
//                   final token = response.data['accessToken'];
//                   final refreshToken = response.data['refreshToken'];
//                   await storage.delete(key: 'token');
//                   await storage.delete(key: 'refreshToken');
//                   storage.write(key: 'token', value: token);
//                   storage.write(key: 'refreshToken', value: refreshToken);
//                 }
//               } catch (e) {
//                 DioException().dioError(e, context);
//               }
//               try {
//                 final token = await storage.read(key: 'token');
//                 final opts = Options(method: requestOptions.method);
//                 dio.options.headers["Authorization"] = "Bearer $token";
//                 final response = await dio.request(
//                   requestOptions.path,
//                   options: opts,
//                   cancelToken: requestOptions.cancelToken,
//                   onReceiveProgress: requestOptions.onReceiveProgress,
//                   data: requestOptions.data,
//                   queryParameters: requestOptions.queryParameters,
//                 );
//                 return handler.resolve(response);
//               } catch (e) {
//                 DioException().dioError(e, context);
//               }
//             }
//           } else {
//             handler.next(e);
//           }
//         },
//       ),
//     );
//     return dio;
//   }
// }
