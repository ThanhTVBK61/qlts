
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../constant.dart';

/// khi gửi json
// Map<String, String> userHeader = {
//   "Content-type": "application/json",
//   "Accept": "application/json"
// };

class ServicesRepository{
  factory ServicesRepository() {
    if (_this == null) _this = ServicesRepository._getInstance();
    return _this;
  }

  static ServicesRepository _this;

  ServicesRepository._getInstance();
  String action;

  ///?????????????????????
  var client = http.Client();

  Future<APIResult> post({String action, dynamic body}) async {
    // var startTime = new DateTime.now().millisecondsSinceEpoch;
    String baseUrl = CONFIG_BASE_URL;
    return client
        .post(
        baseUrl + "/" + action,
        body: body
    )
        .timeout((const Duration(seconds: 15)))
        .then((response) {
      // print('response.statusCode: ${response.statusCode}');
      // print('response.body: ${response.body}');
      final int statusCode = response.statusCode;
      // var endTime = new DateTime.now().millisecondsSinceEpoch;
      // print("hoan thanh trong: " + (endTime - startTime).toString() + "ms");
      if (statusCode == 200) {
        print( json.decode(response.body) is Map);
        return APISuccess(data: json.decode(response.body));
      } else {
        return APIError(type: ErrorType.serverError, statusCode: -1);
      }
    })
        .catchError((err) {
      print("services error " + err.toString() + " - " + action);
      return APIError(type: ErrorType.unknowError, statusCode: -1);
    });
  }

  Future<APIResult> get(String action) async {
    String baseUrl = CONFIG_BASE_URL;
    return client
        .get(
      baseUrl + "/" + action,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    ).then((response) {
      // print('response.statusCode: ${response.statusCode}');
//      print('response.body: ${response.body}');
      final int statusCode = response.statusCode;
      // var endTime = new DateTime.now().millisecondsSinceEpoch;
      // print("hoan thanh trong: " + (endTime - startTime).toString() + "ms");
      if (statusCode == 200) {
        // print(json.decode(response.body));
        return APISuccess(data: json.decode(response.body));
      } else {
        // print(statusCode);
        return APIError(type: ErrorType.serverError, statusCode: -1);
      }
    })
        .catchError((err) {
      print("services error " + err.toString() + " - " + action);
      return APIError(type: ErrorType.unknowError, statusCode: -1);
    });
  }
}

enum ErrorType { serverError, unknowError }

class APIResult {
  APIResult([List props = const []]) : super();
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return 'AppServiceResult';
  }
}

class APISuccess extends APIResult {
  final Map<String, dynamic> data;
  APISuccess({this.data}) : super([data]);
  @override
  String toString() {
    return 'APISuccess + $data';
  }
}

class APIError extends APIResult {
  final ErrorType type;
  final int statusCode;
  APIError({this.type, this.statusCode}) : super([type, statusCode]);
  @override
  String toString() {
    return 'APIError';
  }
}