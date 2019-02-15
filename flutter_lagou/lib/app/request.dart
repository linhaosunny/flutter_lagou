import 'dart:io';
import 'package:dio/dio.dart';

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

enum RequestType {
  local,
  server,
}

class Request {
  static const String baseUrl = 'https://gate.lagou.com';
  static const RequestType sourceType = RequestType.local;
  

  static Future<dynamic> get({String action,Map params}) async {
    if (sourceType == RequestType.local) {
      return Request.mock(action: action,params: params);
    } else {
      return Request.networkGet(action: action,params: params);
    }
  }

  static Future<dynamic> post({String action,Map params}) async {
    if (sourceType == RequestType.local) {
      return Request.mock(action: action,params: params);
    } else {
      return Request.networkPost(action: action,params: params);
    }
    
  }

  static Future<dynamic> mock({String action,Map params}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);

    return responseJson['data'];
  }

  static Future<dynamic> networkGet({String action,Map params}) async {
    var dio = Request.initDio();
    Response<Map> response = await dio.get(action, data: params);
    var data = response.data['data'];
    print(data);

    return data;
  }

  static Future<dynamic> networkPost({String action,Map params}) async {
    var dio = Request.initDio();
    Response<Map> response = await dio.post(action, data: params);
    var data = response.data['data'];
    print(data);

    return data;
  }

  static Dio initDio() {
    var option = Options(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: ContentType.json,
    );

    return Dio(option);
  }
}
