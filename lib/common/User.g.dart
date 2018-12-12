// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as int,
      json['name'] as String,
      json['icon'] as String,
      json['sex'] as int,
      json['status'] as int,
      json['role'] as int,
      json['phone'] as String,
      json['remark'] as String,
      json['activities'] as String,
      (json['updateTime'] as num)?.toDouble(),
      (json['createTime'] as num)?.toDouble());
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'status': instance.status,
      'role': instance.role,
      'phone': instance.phone,
      'remark': instance.remark,
      'activities': instance.activities,
      'updateTime': instance.updateTime,
      'createTime': instance.createTime
    };
