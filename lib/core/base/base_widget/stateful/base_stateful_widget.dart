import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget(this.bloc, {super.key});

  final BlocBase<BaseState> bloc;
}

abstract class BasePageState<B extends BlocBase<BaseState>, W extends BaseStatefulWidget> extends State<W> with ScaffoldWrapper<B> {
  late final _bloc = widget.bloc as B;

  B get bloc => _bloc;

  @override
  Widget build(BuildContext context) {
    return buildBody(context, _bloc);
  }
}
