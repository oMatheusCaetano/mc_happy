import 'package:mc_happy/data/models/orphanage.dart';
import 'package:mc_happy/data/repositories/repository.dart';
import 'package:mc_happy/data/services/apis/api.dart';

class OrphanageRepository extends Repository<Orphanage> {
  OrphanageRepository([Api? api]) : super(api);

  @override
  String apiResourceEndpoint() => 'orphanages';

  @override
  Orphanage modelFromJson(dynamic json) => Orphanage.fromJson(json);
}
