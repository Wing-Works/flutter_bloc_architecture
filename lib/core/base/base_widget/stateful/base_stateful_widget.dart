import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/common_scaffold.dart';

/// Every Page/View should be inherited from this
abstract class BaseStatefulWidget<Bloc extends BlocBase>
    extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BasePageState<Bloc extends BlocBase,
    W extends BaseStatefulWidget<Bloc>> extends State<W> {
  @mustCallSuper
  @protected
  Bloc get provideBase;

  late final Bloc _viewModel = provideBase;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: BlocProvider<Bloc>(
        create: (context) => _viewModel,
        child: buildView(context, _viewModel),
      ),
    );
  }

  /// Actual Screen which load scaffold and load UI
  Widget buildView(BuildContext context, Bloc bloc);
}
