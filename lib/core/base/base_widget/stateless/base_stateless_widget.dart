import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/common_scaffold.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/scaffold/scaffold_wrapper.dart';

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
abstract class BaseStatelessWidget<Bloc extends BlocBase> extends Widget
    with ScaffoldWrapper<Bloc> {
  /// Creates a stateless base widget with optional [key].
  const BaseStatelessWidget({super.key});

  /// Provides the BLoC instance for state management.
  ///
  /// This getter must be implemented to return a new instance of the BLoC that will
  /// manage this widget's state. The BLoC will be automatically provided to child
  /// widgets via [BlocProvider].
  @mustCallSuper
  @protected
  Bloc get bloc;

  /// Called when this widget is first initialized in the widget tree.
  ///
  /// Override this method to perform initialization tasks such as:
  /// * Setting up initial state
  /// * Subscribing to streams
  /// * Initializing controllers
  void initState() {}

  /// Creates the specialized element for managing this widget.
  ///
  /// Do not override this method as it is essential for proper BLoC integration.
  @override
  DataProviderElement<Bloc> createElement() =>
      DataProviderElement<Bloc>(this, bloc);

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

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    widget.initState();
  }

  /// Constructs the widget subtree with BLoC integration and scaffold structure.
  ///
  /// Creates a widget hierarchy that:
  /// 1. Provides the BLoC instance to descendants
  /// 2. Configures the application scaffold and visual structure
  /// 3. Maintains proper widget lifecycle
  @override
  Widget build() {
    return BlocProvider<Bloc>(
      create: (context) => _bloc,
      child: CommonScaffold(scaffoldConfig: widget, context: this, bloc: _bloc),
    );
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
  }
}
