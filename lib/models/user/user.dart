
import 'dart:convert';

import 'package:double_v_partners_jorge_test/models/shared/location.dart';

class User {
  
  int id;
  String name;
  String lastname;
  String birth;
  Location location;
  
  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.birth,
    required this.location,
  });

  User copyWith({
    int? id,
    String? name,
    String? lastname,
    String? birth,
    Location? location,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      birth: birth ?? this.birth,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastname': lastname,
      'birth': birth,
      'location': location.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      lastname: map['lastname'] as String,
      birth: map['birth'] as String,
      location: Location.fromMap(map['location'] as Map<String,dynamic>),
    );
  }

  factory User.empty() => User(id: 0, name: '', lastname: '', birth: '', location: Location.empty());

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastname: $lastname, birth: $birth, location: $location)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.lastname == lastname &&
      other.birth == birth &&
      other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      lastname.hashCode ^
      birth.hashCode ^
      location.hashCode;
  }
}
