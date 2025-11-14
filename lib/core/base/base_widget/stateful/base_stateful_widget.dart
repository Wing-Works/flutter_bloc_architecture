import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';

abstract class BaseStatefulWidget<B extends BlocBase<BaseState>>
    extends StatefulWidget {
  const BaseStatefulWidget(this.bloc, {super.key});

  final B bloc;
}

abstract class BasePageState<
  B extends BlocBase<BaseState>,
  W extends BaseStatefulWidget<B>
>
    extends ScaffoldWrapper<B, W> {
  B get bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return buildBody(context, bloc);
  }
}
