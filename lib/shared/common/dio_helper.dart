import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum Method { get, post, delete, put }

const methodValues = {
  Method.get: 'get',
  Method.post: 'post',
  Method.delete: 'delete',
  Method.put: 'put',
};

typedef HttpSuccessCallback<T> = void Function(T data);
typedef HttpFailureCallback = void Function(ErrorEntity data);
typedef ProgressCallback = void Function(int count, int total);

CancelToken cancelToken = CancelToken();

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class DioHelper {
  Future request<T>(
    String baseUrl, {
    Method method = Method.get,
    String? path = '',
    String contentType = Headers.jsonContentType,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required HttpSuccessCallback<T> success,
    required HttpFailureCallback error,
  }) async {
    try {
      BaseOptions baseOptions = BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType,
          //responseType: ResponseType.bytes,
          receiveDataWhenStatusError: false,
          connectTimeout: 60000,
          receiveTimeout: 3000,
          headers: {});

      var dio = Dio(baseOptions)..interceptors.addAll(logInterceptor());

      Options requestOptions = options ?? Options();
      requestOptions.headers = requestOptions.headers ?? {};

      // GLOBAL OR COMMON AUTHORIZATION HEADER
      /*Map<String, dynamic>? authorization = getAuthorizationHeader();
      if (authorization != null) {
        requestOptions.headers?.addAll(authorization);
      }*/

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
      };

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

      var response = await dio.request(path!, data: data,
          onSendProgress: (received, total) {
        if (total != -1) {
          Get.log((received / total * 100).toStringAsFixed(0) + '%');
        }
      },
          queryParameters: queryParameters,
          options: Options(method: methodValues[method]),
          cancelToken: cancelToken);

      success(response.data);
    } on DioError catch (e) {
      error(_createErrorEntity(e));
    }
  }

  logInterceptor() {
    return [LogInterceptor(requestBody: true, responseBody: true)];
  }

/*  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    if (Global.accessToken != null) {
      headers = {'Authorization': 'Bearer ${Global.accessToken}'};
    }
    return headers;
  }*/

  void cancelRequests(CancelToken token) {
    token.cancel('cancelled');
  }

  ErrorEntity _createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: 'dioRequestCancellation'.tr);
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioConnectionTimeOut'.tr);
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioRequestTimeOut'.tr);
        }
      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioResponseTimeout'.tr);
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response?.statusCode;
            switch (errCode) {
              case 400:
                return ErrorEntity(
                    code: errCode!, message: 'dioRequestSyntaxError'.tr);

              case 403:
                return ErrorEntity(
                    code: errCode!, message: 'dioServerRefusedToExecute'.tr);

              case 404:
                return ErrorEntity(
                    code: errCode!, message: 'dioNotConnectServer'.tr);

              case 405:
                return ErrorEntity(
                    code: errCode!, message: 'dioRequestForbidden'.tr);

              case 500:
                return ErrorEntity(
                    code: errCode!, message: 'dioServerInternalError'.tr);

              case 502:
                return ErrorEntity(
                    code: errCode!, message: 'dioInvalidRequest'.tr);

              case 503:
                return ErrorEntity(code: errCode!, message: 'dioServerDown'.tr);

              case 505:
                return ErrorEntity(
                    code: errCode!, message: 'dioHttpNotSupport'.tr);

              default:
                return ErrorEntity(
                    code: errCode!, message: 'dioUnknownMistake'.tr);
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: 'dioUnknownError'.tr);
          }
        }

      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }
}

class ErrorEntity {
  final int code;
  final String message;

  ErrorEntity({required this.code, required this.message});
}
