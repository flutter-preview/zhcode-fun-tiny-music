import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:tiny_music/models/account.dart';
import 'package:tiny_music/utils/util.dart';

class Fetch {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );
  final currentAccount = Account();

  Fetch._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.queryParameters['f'] = 'json';
          options.queryParameters['u'] = currentAccount.username;
          options.queryParameters['c'] = currentAccount.appName;
          options.queryParameters['t'] = currentAccount.subsonicToken;
          options.queryParameters['s'] = currentAccount.salt;
          options.queryParameters['v'] = currentAccount.version ?? '1.16.1';
          return handler.next(options);
        },
      ),
    );
  }
  static final Fetch _req = Fetch._internal();
  factory Fetch() => _req;

  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  /// path 请求路径
  /// query 可选，请求需要携带的参数
  Future<Map<String, dynamic>?> get(String path, [dynamic query]) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Util.showErrorMessage('请检查网络状况是否正常');
      return null;
    }
    Response? response;
    try {
      response = await _dio.get(path, queryParameters: query);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        Util.showErrorMessage('请求超时');
        throw HttpException('接口请求超时---$e');
      } else {
        _checkErrorRes(e.response);
        throw HttpException('接口请求出错---$e');
      }
    } catch (e) {
      Util.showErrorMessage('请求接口异常');
      throw HttpException('接口请求异常---$e');
    }
    if (response.data is Map<String, dynamic>) {
      return response.data['subsonic-response'];
    }
    return null;
  }

  /// path 请求路径
  /// body 可选，请求需要携带的数据
  Future<dynamic> post(String path, [dynamic body]) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Util.showErrorMessage('请检查网络状况是否正常');
      return null;
    }
    Response? response;
    try {
      response = await _dio.post(
        path,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        Util.showErrorMessage('请求超时');
        throw HttpException('接口请求超时---$e');
      } else {
        _checkErrorRes(e.response);
        throw HttpException('接口请求出错---$e');
      }
    } catch (e) {
      Util.showErrorMessage('接口请求异常');
      throw HttpException('接口请求异常---$e');
    }
    return response.data;
  }

  void _checkErrorRes(Response<dynamic>? response) {
    if (response?.data != null && response!.data is Map) {
      final resMap = response.data as Map<String, dynamic>;
      if (resMap.containsKey('error')) {
        switch (resMap['error']) {
          case 'Invalid username or password':
            Util.showErrorMessage('用户名或密码错误');
            break;
          default:
            Util.showErrorMessage(resMap['error'] ?? '接口请求异常');
        }
      }
    }
  }
}
