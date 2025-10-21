// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'error_entity.dart';

class ErrorEntityMapper extends ClassMapperBase<ErrorEntity> {
  ErrorEntityMapper._();

  static ErrorEntityMapper? _instance;
  static ErrorEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorEntity';

  static String _$type(ErrorEntity v) => v.type;
  static const Field<ErrorEntity, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: '',
  );
  static int _$code(ErrorEntity v) => v.code;
  static const Field<ErrorEntity, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
    def: 0,
  );
  static String _$message(ErrorEntity v) => v.message;
  static const Field<ErrorEntity, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ErrorEntity> fields = const {
    #type: _f$type,
    #code: _f$code,
    #message: _f$message,
  };

  static ErrorEntity _instantiate(DecodingData data) {
    return ErrorEntity(
      type: data.dec(_f$type),
      code: data.dec(_f$code),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorEntity>(map);
  }

  static ErrorEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ErrorEntity>(json);
  }
}

mixin ErrorEntityMappable {
  String toJsonString() {
    return ErrorEntityMapper.ensureInitialized().encodeJson<ErrorEntity>(
      this as ErrorEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ErrorEntityMapper.ensureInitialized().encodeMap<ErrorEntity>(
      this as ErrorEntity,
    );
  }

  ErrorEntityCopyWith<ErrorEntity, ErrorEntity, ErrorEntity> get copyWith =>
      _ErrorEntityCopyWithImpl<ErrorEntity, ErrorEntity>(
        this as ErrorEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ErrorEntityMapper.ensureInitialized().stringifyValue(
      this as ErrorEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ErrorEntityMapper.ensureInitialized().equalsValue(
      this as ErrorEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ErrorEntityMapper.ensureInitialized().hashValue(this as ErrorEntity);
  }
}

extension ErrorEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ErrorEntity, $Out> {
  ErrorEntityCopyWith<$R, ErrorEntity, $Out> get $asErrorEntity =>
      $base.as((v, t, t2) => _ErrorEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ErrorEntityCopyWith<$R, $In extends ErrorEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type, int? code, String? message});
  ErrorEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ErrorEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ErrorEntity, $Out>
    implements ErrorEntityCopyWith<$R, ErrorEntity, $Out> {
  _ErrorEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorEntity> $mapper =
      ErrorEntityMapper.ensureInitialized();
  @override
  $R call({String? type, int? code, String? message}) => $apply(
    FieldCopyWithData({
      if (type != null) #type: type,
      if (code != null) #code: code,
      if (message != null) #message: message,
    }),
  );
  @override
  ErrorEntity $make(CopyWithData data) => ErrorEntity(
    type: data.get(#type, or: $value.type),
    code: data.get(#code, or: $value.code),
    message: data.get(#message, or: $value.message),
  );

  @override
  ErrorEntityCopyWith<$R2, ErrorEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ErrorEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

