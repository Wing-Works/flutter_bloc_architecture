import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';

/// A base widget class for creating stateless screens with integrated BLoC pattern support.
///
/// This abstract class serves as a foundation for building stateless UI components that leverage
/// the BLoC pattern for state management. Key features include:
///
/// * Automatic BLoC lifecycle management and dependency injection
/// * Built-in scaffold and app bar integration via [ScaffoldWrapper]
/// * Support for initialization and cleanup operations
/// * Type-safe BLoC instance access
/// * Automatic resource disposal
abstract class BaseStatelessWidget<B extends BlocBase<BaseState>> extends Widget
    with ScaffoldWrapper<B> {
  /// Creates a stateless base widget with optional [key].
  const BaseStatelessWidget(this.bloc, {super.key});

  final B bloc;

  /// Creates the specialized element for managing this widget.
  ///
  /// Do not override this method as it is essential for proper BLoC integration.
  @override
  DataProviderElement<B> createElement() {
    return DataProviderElement<B>(this, bloc);
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
class DataProviderElement<B extends BlocBase<BaseState>>
    extends ComponentElement {
  /// Creates a new element for managing a [BaseStatelessWidget] widget.
  ///
  /// The [widget] parameter is the parent [BaseStatelessWidget] instance, and [_bloc]
  /// is the BLoC instance that will be provided to the widget subtree.
  DataProviderElement(BaseStatelessWidget super.widget, this._bloc);

  /// The BLoC instance managed by this element.
  final B _bloc;

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
