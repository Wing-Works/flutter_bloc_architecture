import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/common_scaffold.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';

/// Base widget class that all stateful pages should inherit from.
///
/// Provides basic structure and BLoC integration for stateful widgets.
/// [Bloc] represents the BLoC type that will be used with this widget.
abstract class BaseStatefulWidget<Bloc extends BlocBase>
    extends StatefulWidget {
  /// Creates a [BaseStatefulWidget].
  ///
  /// The [key] parameter is optional and is passed to the superclass.
  const BaseStatefulWidget({super.key});
}

/// Base state class that handles the state management for [BaseStatefulWidget].
///
/// Implements common scaffold functionality through [ScaffoldWrapper] and
/// provides BLoC integration.
///
/// Type parameters:
/// * [Bloc] - The type of BLoC this state will manage
/// * [W] - The associated widget type that extends [BaseStatefulWidget]
abstract class BasePageState<Bloc extends BlocBase,
        W extends BaseStatefulWidget<Bloc>> extends State<W>
    with ScaffoldWrapper<Bloc> {
  /// Abstract getter that must be implemented by subclasses to provide
  /// the BLoC instance.
  ///
  /// This method is annotated with [@mustCallSuper] to ensure proper
  /// initialization in derived classes.
  @mustCallSuper
  @protected
  Bloc get bloc;

  /// The BLoC instance that will be used throughout the widget's lifecycle.
  ///
  /// Initialized lazily using the [bloc] getter.
  late final Bloc _bloc = bloc;

  /// Builds the widget hierarchy for this page/view.
  ///
  /// Wraps the content in a [BlocProvider] and [CommonScaffold] to provide
  /// BLoC access and consistent scaffold structure.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Bloc>(
      create: (context) => _bloc,
      child: CommonScaffold(
        scaffoldConfig: this,
        context: context,
        bloc: _bloc,
      ),
    );
  }
}
