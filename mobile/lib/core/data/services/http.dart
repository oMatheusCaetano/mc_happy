import 'package:http/http.dart' as http;

class Http {
  String? url;

  Http({this.url});

  Future<HttpResponse> get(String? url) async {
    return Http.read(handleUri(url));
  }

  static Future<HttpResponse> read(String url) async {
    var response = await http.get(Uri.parse(url));
    return HttpResponse.fromHttpPackageResponse(response);
  }

  Future<HttpResponse> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    return Http.store(handleUri(url), body: body, headers: headers);
  }

  static Future<HttpResponse> store(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    var r = await http.post(Uri.parse(url), body: body, headers: headers);
    return HttpResponse.fromHttpPackageResponse(r);
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
  final HttpResponseStatus status;
  final int code;

  HttpResponse({this.data, required this.status, required this.code});
  factory HttpResponse.fromHttpPackageResponse(http.Response response) =>
      HttpResponse(
          data: response.body,
          code: response.statusCode,
          status: (response.statusCode >= 200) && (response.statusCode <= 299)
              ? HttpResponseStatus.success
              : HttpResponseStatus.error);

  @override
  String toString() {
    return 'HttpResponse: ${{
      'data': data.toString(),
      'status': status,
      'code': code
    }}';
  }
}
