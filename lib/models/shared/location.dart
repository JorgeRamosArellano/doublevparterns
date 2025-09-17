import 'dart:convert';

class Location {
  String country;
  String state;
  String city;
  String direction;

  Location({
    required this.country,
    required this.state,
    required this.city,
    required this.direction,
  });

  Location copyWith({
    String? country,
    String? state,
    String? city,
    String? direction,
  }) {
    return Location(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      direction: direction ?? this.direction,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'state': state,
      'city': city,
      'direction': direction,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      direction: map['direction'] as String,
    );
  }

  factory Location.empty() => Location(country: '', state: '', city: '', direction: '');

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(country: $country, state: $state, city: $city, direction: $direction)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;
  
    return 
      other.country == country &&
      other.state == state &&
      other.city == city &&
      other.direction == direction;
  }

  @override
  int get hashCode {
    return country.hashCode ^
      state.hashCode ^
      city.hashCode ^
      direction.hashCode;
  }
}
