import 'dart:convert';
import 'package:dio/dio.dart';

class Http {
  String? url;

  Http({this.url});

  Future<HttpResponse> get(String? url) async => Http.read(handleUri(url));

  static Future<HttpResponse> read(String url) async {
    var response = await Dio().get(url);
    return HttpResponse.from(response);
  }

  Future<HttpResponse> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async =>
      Http.store(handleUri(url), body: body, headers: headers);

  static Future<HttpResponse> store(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    var response = await Dio().post(url, data: body);
    return HttpResponse.from(response);
  }

  String handleUri(String? url) {
    if (this.url == null && url == null) {
      throw Exception('URL not specified.');
    }

    if (url == null) {
      return this.url!;
    }

    if (this.url == null) {
      return url;
    }

    String start = this.url!;
    String end = url;

    if (start.endsWith('/')) {
      start = start.substring(0, start.length - 1);
    }

    if (end.endsWith('/')) {
      end = end.substring(0, end.length - 1);
    }

    return '$start/$end';
  }
}

enum HttpResponseStatus {
  error,
  success,
}

class HttpResponse {
  final dynamic data;
  late final HttpResponseStatus status;
  final int code;

  HttpResponse({this.data, HttpResponseStatus? status, required this.code});
  factory HttpResponse.from(Response response) {
    int sCode = response.statusCode ?? 0;

    return HttpResponse(
      data: response.data,
      code: sCode,
      status: (sCode >= 200) && (sCode <= 299)
          ? HttpResponseStatus.success
          : HttpResponseStatus.error,
    );
  }

  @override
  String toString() {
    return 'HttpResponse: ${{
      'data': data.toString(),
      'status': status,
      'code': code
    }}';
  }
}
