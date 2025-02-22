import 'package:json_annotation/json_annotation.dart';

part 'error_entity.g.dart';

@JsonSerializable()
class ErrorEntity {
  ErrorEntity({
    this.type = '',
    this.code = 0,
    this.message = '',
  });

  int code;
  String type;
  String message;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) {
    return _$ErrorEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);
}
