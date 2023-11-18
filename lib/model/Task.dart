import 'package:json_annotation/json_annotation.dart';

part 'Task.g.dart';

@JsonSerializable()
class Task {
  final String? id;
  final String? name;

  const Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String? avatar;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
