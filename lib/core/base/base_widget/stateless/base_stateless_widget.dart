import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';

abstract class BaseStatelessWidget<Bloc extends BlocBase> extends Widget
    with ScaffoldWrapper<Bloc> {
  /// Creates a stateless base widget with optional [key].
  const BaseStatelessWidget({super.key, required this.bloc});

  /// Provides the BLoC instance for state management.
  ///
  /// This getter must be implemented to return a new instance of the BLoC that will
  /// manage this widget's state. The BLoC will be automatically provided to child
  /// widgets via [BlocProvider].
  final Bloc bloc;

  /// Creates the specialized element for managing this widget.
  ///
  /// Do not override this method as it is essential for proper BLoC integration.
  @override
  DataProviderElement<Bloc> createElement() {
    return DataProviderElement<Bloc>(this, bloc);
  }

  /// Performs cleanup when this widget is removed from the tree.
  ///
  /// Override this method to handle cleanup tasks such as:
  /// * Cancelling subscriptions
  /// * Disposing controllers
  /// * Closing streams
  /// * Releasing resources
  void dispose() {}
}

/// A specialized element that manages the lifecycle and dependencies of [BaseStatelessWidget] widgets.
///
/// This element coordinates:
/// * BLoC dependency injection and lifecycle management
/// * Widget initialization and cleanup
/// * Scaffold and visual structure integration
/// * Proper resource disposal
///
/// This is an internal implementation detail and should not be used directly by application code.
class DataProviderElement<Bloc extends BlocBase> extends ComponentElement {
  /// Creates a new element for managing a [BaseStatelessWidget] widget.
  ///
  /// The [widget] parameter is the parent [BaseStatelessWidget] instance, and [_bloc]
  /// is the BLoC instance that will be provided to the widget subtree.
  DataProviderElement(BaseStatelessWidget super.widget, this._bloc);

  /// The BLoC instance managed by this element.
  final Bloc _bloc;

  /// Reference to the parent widget with proper type casting.
  @override
  late final BaseStatelessWidget widget = super.widget as BaseStatelessWidget;

  /// Constructs the widget subtree with BLoC integration and scaffold structure.
  ///
  /// Creates a widget hierarchy that:
  /// 1. Provides the BLoC instance to descendants
  /// 2. Configures the application scaffold and visual structure
  /// 3. Maintains proper widget lifecycle
  @override
  Widget build() {
    return widget.buildBody(this, _bloc);
  }

  /// Handles proper cleanup when this element is removed from the tree.
  ///
  /// This method ensures:
  /// * Parent element cleanup is performed
  /// * Widget-specific disposal logic is executed
  /// * All resources are properly released
  @override
  void unmount() {
    super.unmount();
    widget.dispose();
  }
}
