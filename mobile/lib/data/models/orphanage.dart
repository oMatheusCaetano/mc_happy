import 'package:mc_happy/data/models/model.dart';

class Orphanage extends Model {
  String id;
  String name;
  String? about;
  String? cellphone;

  Orphanage({
    required this.id,
    required this.name,
    this.about,
    this.cellphone,
  });

  factory Orphanage.fromJson(Map<String, dynamic> json) => Orphanage(
    id: json['id'].toString(),
    name: json['name'],
    about: json['about'],
    cellphone: json['cellphone'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'about': about,
    'cellphone': cellphone,
  };
  
  @override
  List<Object?> get props => [
    id,
    name,
    about,
    cellphone,
  ];
}
