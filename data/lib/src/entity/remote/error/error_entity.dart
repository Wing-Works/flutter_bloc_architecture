import 'package:dart_mappable/dart_mappable.dart';

part 'error_entity.mapper.dart';

@MappableClass()
class ErrorEntity with ErrorEntityMappable {
  ErrorEntity({this.type = '', this.code = 0, this.message = ''});

  int code;
  String type;
  String message;

  static const fromJson = ErrorEntityMapper.fromJson;
}
