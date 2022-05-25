import 'package:mc_happy/data/models/model.dart';
import 'package:mc_happy/data/services/apis/api.dart';

abstract class Repository<T extends Model> {
  late final Api api;

  Repository([Api? api]) {
    this.api = api ?? Api.getInstance();
  }

  Future<List<T>> all() async {
    var response = await api.get(apiResourceEndpoint());
    return List.from((response.data as List<dynamic>).map(modelFromJson));
  }

  Future<T> create(dynamic data) async {
    var response = await api.post(
      apiResourceEndpoint(), 
      body: data is T ? data.toJson() : data,
    );
    return modelFromJson(response.data);
  }

  String apiResourceEndpoint();
  T modelFromJson(dynamic json);
}
