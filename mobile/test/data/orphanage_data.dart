import 'dart:convert';

import 'package:mc_happy/data/models/orphanage.dart';

makeSampleOrphanage(id) => Orphanage(
    id: id,
    name: 'Orphanage Test',
    about: 'About Orphanage Test',
    cellphone: '5562988889999',
  );

String apiResourceEndpoint = 'orphanages';
Orphanage sampleOrphanage = makeSampleOrphanage('123');
Orphanage sampleOrphanage2 = makeSampleOrphanage('321');

Map<String, dynamic> sampleOrphanageMap = {
  'id': sampleOrphanage.id,
  'name': sampleOrphanage.name,
  'about': sampleOrphanage.about,
  'cellphone': sampleOrphanage.cellphone,
};

Map<String, dynamic> sampleOrphanageMap2 = {
  'id': sampleOrphanage2.id,
  'name': sampleOrphanage2.name,
  'about': sampleOrphanage2.about,
  'cellphone': sampleOrphanage2.cellphone,
};

String sampleOrphanageString = jsonEncode(sampleOrphanageMap);
String sampleOrphanageString2 = jsonEncode(sampleOrphanageMap2);
List<Orphanage> sampleOrphanagesList = [sampleOrphanage, sampleOrphanage2];
List<Map<String, dynamic>> sampleOrphanagesListMap = [
  sampleOrphanageMap, 
  sampleOrphanageMap2,
];