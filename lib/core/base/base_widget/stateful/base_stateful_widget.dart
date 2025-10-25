import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final BlocBase bloc;

  const BaseStatefulWidget(this.bloc, {super.key});
}

abstract class BasePageState<
  Bloc extends BlocBase,
  W extends BaseStatefulWidget
>
    extends State<W>
    with ScaffoldWrapper<Bloc> {
  late final Bloc bloc = widget.bloc as Bloc;

  @override
  Widget build(BuildContext context) {
    return buildBody(context, bloc);
  }
}
