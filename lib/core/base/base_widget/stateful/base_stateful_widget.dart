import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';

/// Base widget class that all stateful pages should inherit from.
///
/// Provides basic structure and BLoC integration for stateful widgets.
/// [Bloc] represents the BLoC type that will be used with this widget.
abstract class BaseStatefulWidget<B extends BlocBase<BaseState>>
    extends StatefulWidget {
  const BaseStatefulWidget(this.bloc, {super.key});

  final B bloc;
}

/// Base state class that handles the state management for [BaseStatefulWidget].
///
/// Implements common scaffold functionality through [ScaffoldWrapper] and
/// provides BLoC integration.
///
/// Type parameters:
/// * [Bloc] - The type of BLoC this state will manage
/// * [W] - The associated widget type that extends [BaseStatefulWidget]
abstract class BasePageState<
  B extends BlocBase<BaseState>,
  W extends BaseStatefulWidget<B>
>
    extends State<W>
    with ScaffoldWrapper<B> {
  /// The BLoC instance that will be used throughout the widget's lifecycle.
  ///
  /// Initialized lazily using the [bloc] getter.
  B get bloc => widget.bloc;

  /// Builds the widget hierarchy for this page/view.
  ///
  /// Wraps the content in a [BlocProvider] and [CommonScaffold] to provide
  /// BLoC access and consistent scaffold structure.
  @override
  Widget build(BuildContext context) {
    return buildBody(context, bloc);
  }
}
