import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/common_scaffold.dart';

/// Abstract class that extends [Widget] and provides a base structure for stateless widgets
/// that use a [Bloc] for state management.
///
/// The class ensures that each extending widget provides its own [Bloc] and a [build] method.
/// It also provides a default implementation for creating a [Scaffold] with an optional [AppBar].
///
/// [Bloc] is a generic type that must extend [BlocBase].
abstract class StatelessBase<Bloc extends BlocBase> extends Widget {
  /// Constructor for [StatelessBase].
  const StatelessBase({super.key});

  /// Must be overridden by subclasses to provide the [Bloc] instance.
  @mustCallSuper
  @protected
  Bloc get bloc;

  /// Must be overridden by subclasses to build the widget's UI.
  ///
  /// [context] is the current [BuildContext].
  /// [bloc] is the [Bloc] instance provided by the subclass.
  @protected
  Widget build(BuildContext context, Bloc bloc);

  /// Creates a [DataProviderElement] for this widget.
  @override
  DataProviderElement<Bloc> createElement() =>
      DataProviderElement<Bloc>(this, bloc);

  /// Builds an [AppBar] for the screen.
  ///
  /// Subclasses can override this method to provide their own [AppBar].
  /// Returns `null` by default, indicating no [AppBar].
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Disposes resources if needed.
  ///
  /// Subclasses can override this method to perform cleanup.
  void dispose() {}
}

/// Custom [ComponentElement] for [StatelessBase] widgets.
///
/// This element is responsible for providing the [Bloc] to its child widget and building the [Scaffold].
class DataProviderElement<Bloc extends BlocBase> extends ComponentElement {
  /// Constructor for [DataProviderElement].
  ///
  /// [widget] is the [StatelessBase] widget that created this element.
  /// [_bloc] is the [Bloc] instance provided by the widget.
  DataProviderElement(StatelessBase super.widget, this._bloc);

  /// The [Bloc] instance provided by the [StatelessBase] widget.
  final Bloc _bloc;

  /// Ensures that [widget] is of type [StatelessBase].
  @override
  late final StatelessBase widget = super.widget as StatelessBase;

  /// Builds the widget tree.
  ///
  /// Wraps the child widget with a [BlocProvider] to provide the [Bloc] to its subtree.
  /// Builds a [Scaffold] with an optional [AppBar] and the child widget's body.
  @override
  Widget build() {
    return CommonScaffold(
      body: BlocProvider<Bloc>(
        create: (context) => _bloc,
        child: widget.build(this, _bloc),
      ),
    );
  }

  /// Called when the element is deactivated.
  ///
  /// Calls the `dispose` method of the [StatelessBase] widget to perform cleanup.
  @override
  void deactivate() {
    super.deactivate();
    widget.dispose();
  }
}
