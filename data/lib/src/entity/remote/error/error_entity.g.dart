// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) => ErrorEntity(
      type: json['type'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorEntityToJson(ErrorEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'message': instance.message,
    };
