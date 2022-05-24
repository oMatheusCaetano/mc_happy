import 'package:flutter_test/flutter_test.dart';
import 'package:mc_happy/data/models/orphanage.dart';

import '../orphanage_data.dart';

void main() {
  test('Should create an Orphanage from a JSON(Map)', () async {
    expect(Orphanage.fromJson(sampleOrphanageMap), sampleOrphanage);
  });

  test('Should convert to JSON(Map)', () async {
    expect(sampleOrphanage.toJson(), sampleOrphanageMap);
  });
}
