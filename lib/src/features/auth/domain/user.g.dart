// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      json['id'] as int?,
      json['username'] as String?,
      json['email'] as String?,
      json['patient'] as int?,
      json['isVegan'] as bool?,
      json['points'] as int?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'patient': instance.patient,
      'isVegan': instance.isVegan,
      'points': instance.points,
    };
