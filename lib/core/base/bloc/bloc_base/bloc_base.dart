import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/state/base_state.dart';
import 'package:flutter_clean_architecture/core/util/request_controller.dart';

abstract class BlocBase<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> with RequestController {
  BlocBase(super.initialState) {
    mapEventToState();
    init();
  }

  @mustCallSuper
  @protected
  void mapEventToState();

  void init() {}
}
