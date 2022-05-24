import 'package:mc_happy/data/services/http.dart';

class Api extends Http {
  static Api? _instance;

  Api._internal(String url): super(url: url);

  static Api getInstance() {
    return _instance ?? Api._internal('http://192.168.0.105:8000/api');
  }
}
