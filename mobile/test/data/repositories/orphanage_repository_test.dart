import 'package:flutter_test/flutter_test.dart';
import 'package:mc_happy/data/repositories/orphanage_repository.dart';
import 'package:mc_happy/data/services/http.dart';
import 'package:mockito/mockito.dart';

import '../orphanage_data.dart';
import '../services/apis/apis_mocks.dart';

void main() {
  final api = ApiMock();
  final repository = OrphanageRepository(api);

  test('Should list all orphanages on method [all]', () async {
    //? Arrange
    when(api.get(any)).thenReturn(Future.value(HttpResponse(
      code: 200,
      data: sampleOrphanagesListMap,
    )));

    var result = await repository.all();

    expect(result, sampleOrphanagesList);
  });

  test('Should define correct api resource endpoint', () async {
    expect(OrphanageRepository().apiResourceEndpoint(), apiResourceEndpoint);
  });

  test('Should convert JSON(Map) to orphanage', () async {
    expect(
      OrphanageRepository().modelFromJson(sampleOrphanageMap),
      sampleOrphanage,
    );
  });
}
