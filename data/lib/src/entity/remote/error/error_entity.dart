import 'package:json_annotation/json_annotation.dart';

part 'error_entity.g.dart';

@JsonSerializable()
class ErrorEntity {
  ErrorEntity({this.type = '', this.code = 0, this.message = ''});

  factory ErrorEntity.fromJson(Map<String, dynamic> json) {
    return _$ErrorEntityFromJson(json);
  }

  int code;
  String type;
  String message;

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);
}
