import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()

class User {
  int id;
  String name;
  String icon;
  int sex;
  int status;
  int role;
  String phone;
  String remark;
  String activities;
  double updateTime;
  double createTime;

  User(
      this.id,
      this.name,
      this.icon,
      this.sex,
      this.status,
      this.role,
      this.phone,
      this.remark,
      this.activities,
      this.updateTime,
      this.createTime
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.empty();
}