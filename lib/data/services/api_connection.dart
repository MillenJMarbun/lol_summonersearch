import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';

abstract class ApiConnection {
  static Dio _dio = Dio();

  static String _success = 'CONNECTION_SECURE';

  /*static List<String> _allowedFingerprints = [
    SV.getKey(VarConst.rcf).replaceAll(':', ' '),
  ];*/

  /* static Future<bool> _checkCertificate({required String url}) async {
    try {
      var result = await SslPinningPlugin.check(
        serverURL: url,
        sha: SHA.SHA256,
        allowedSHAFingerprints: _allowedFingerprints,
        timeout: 5000,
      );
      if (result == _success) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }*/

  static String api_key = 'RGAPI-cbeec808-12f6-4ddf-82ee-d26e2c6161a5';

  static Map<String, dynamic> _headerOptions() {
    return {
      'Content-Type': 'application/json',
      'apiKey': api_key, /*SV.getKey(VarConst.rak),*/
    };
  }

  /* static Map<String, dynamic> _headerOptionsCrypt() {
    return {
      'Content-Type': 'text/plain',
      'apiKey': SV.getKey(VarConst.rak),
    };
  }*/

  static Future<String> postData(
      {required String url, required Map<String, dynamic> params}) async {
    try {
      //var secured = await _checkCertificate(url: url);
      var secured = true;
      if (secured) {
        _dio = Dio();
        //_dio.interceptors.add(ChuckerDioInterceptor());
        print("JINXXXXXX: ${url}");
        var response = await _dio.get(
          url,
          //data: params,
          options: Options(headers: _headerOptions()),
        );
        _dio.close();
        return response.toString();
      } else {
        throw (ExceptionEntity(
          code: 0,
          errorMessage: 'Insecure Connection',
          errorDescription: 'Your SSL Certificate is not verified',
        ));
      }
    } on DioError catch (e) {
      throw (e);
    }
  }

  /* static Future<String> postDataCrypt(
      {required String url,
      required Map<String, dynamic> params,
      int connectTimeout = 5,
      int receiveTimeout = 10}) async {
    try {
      //var secured = await _checkCertificate(url: url);
      var secured = true;
      if (secured) {
        // Dio options
        BaseOptions options = new BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
          connectTimeout: connectTimeout * 1000, // 5 seconds
          receiveTimeout: receiveTimeout * 1000, // 10 seconds
        );
        // Enkrip body request nya
        print(jsonEncode(params));
        String encrypted_param = encryptAESCryptoJS(jsonEncode(params), "");
        print("Encrypt param : " + encrypted_param);
        _dio = Dio(options);
        // Add interceptor using chucker for debugging purpose
        // _dio.interceptors.add(ChuckerDioInterceptor());
        var response = await _dio.post(
          url,
          data: encrypted_param,
          // Gunakan header option text/plain di Content-Type nya
          options: Options(headers: _headerOptionsCrypt()),
        );
        print("Encrypt response : " + response.data);
        // Decrypt response data
        var decrypt = decryptAESCryptoJS(response.data.toString(), "");
        print("Decrypt response : " + decrypt);
        print(decrypt);
        _dio.close();
        return decrypt;
      } else {
        // throw an exception when SSL is invalid
        throw (ExceptionEntity(
          code: 0,
          errorMessage: 'Insecure Connection',
          errorDescription: 'Your SSL Certificate is not verified',
        ));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        // Connect timeout
        throw (ExceptionEntity(
          code: 0,
          errorMessage: 'Connection Timeout',
          errorDescription: 'exceed $connectTimeout second attempt to connect',
        ));
      }
      if (e.type == DioErrorType.receiveTimeout) {
        // Receive data timeout
        throw (ExceptionEntity(
          code: 0,
          errorMessage: 'Receive Timeout',
          errorDescription:
              'exceed $receiveTimeout second attempt to receive data from server',
        ));
      }
      if (e.type == DioErrorType.other) {
        // Receive data timeout
        throw (ExceptionEntity(
          code: 0,
          errorMessage: 'Other Error',
          errorDescription: e.message,
        ));
      }
      // another DioError type
      throw (e);
    }
  }*/

  static GetIcon({required String url}) async {
    print("heres the url = $url");
    try {
      var response = await Dio().get(
        url,
      );
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static GetMatches({required String url}) async {
    print("heres the url = $url");
    try {
      var response = await Dio().get(
        url,
      );
      print("GetMatches Response Data: ${response.data}");
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
