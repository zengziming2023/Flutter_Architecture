import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "age")
  int? age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }
}
