import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/state/base_state.dart';
import 'package:flutter_clean_architecture/core/util/request_controller.dart';

abstract class CubitBase<S extends BaseState> extends Cubit<S>
    with RequestController {
  CubitBase(super.state) {
    init();
  }

  void init() {}
}
