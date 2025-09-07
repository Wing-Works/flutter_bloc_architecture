import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A mixin that provides a structured way to build a Scaffold with customizable components
///
/// This mixin is designed to work with BLoC pattern and provides methods to override
/// various Scaffold properties and widgets
mixin ScaffoldWrapper<B extends BlocBase> {
  /// Builds the main content view of the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  @mustCallSuper
  @protected
  Widget buildView(BuildContext context, B bloc);

  /// Builds the app bar for the scaffold
  ///
  /// Returns null by default, override to provide custom app bar
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  PreferredSizeWidget? buildAppbar(BuildContext context, B bloc) => null;

  /// The key for the scaffold widget
  Key? get scaffoldKey => null;

  /// The background color of the scaffold
  Color? get backgroundColor => null;

  /// Builds the drawer widget for the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  Widget? drawer(BuildContext context, B bloc) => null;

  /// Callback when the drawer open state changes
  ///
  /// [isOpened] Whether the drawer is opened or closed
  void onDrawerChanged(bool isOpened) {}

  /// Builds the end drawer widget for the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  Widget? endDrawer(BuildContext context, B bloc) => null;

  /// Callback when the end drawer open state changes
  ///
  /// [isOpened] Whether the end drawer is opened or closed
  void onEndDrawerChanged(bool isOpened) {}

  /// Whether the [body] should extend to the bottom of the scaffold
  bool get extendBody => false;

  /// Whether the [body] should extend behind the [appBar]
  bool get extendBodyBehindAppBar => false;

  /// Builds the bottom navigation bar for the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  Widget? bottomNavigationBar(BuildContext context, B bloc) => null;

  /// Builds the bottom sheet for the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  Widget? bottomSheet(BuildContext context, B bloc) => null;

  /// Builds the floating action button for the scaffold
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  Widget? floatingActionButton(BuildContext context, B bloc) => null;

  /// The location where the floating action button should be positioned
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  /// The animator that controls the animation of the floating action button
  FloatingActionButtonAnimator? get floatingActionButtonAnimator => null;

  /// Builds the list of persistent footer buttons
  ///
  /// [context] The build context
  /// [bloc] The BLoC instance associated with this view
  List<Widget>? persistentFooterButtons(BuildContext context, B bloc) => null;

  /// The alignment of the persistent footer buttons
  AlignmentDirectional get persistentFooterAlignment =>
      AlignmentDirectional.centerEnd;

  /// Whether the scaffold is the primary navigator
  bool get primary => true;

  /// Whether the scaffold should resize to avoid the bottom inset
  bool? get resizeToAvoidBottomInset => null;

  /// The restoration ID for the scaffold
  String? get restorationId => null;

  /// The color of the drawer scrim
  Color? get drawerScrimColor => null;

  /// The width of the area where a drawer can be dragged from
  double? get drawerEdgeDragWidth => null;

  /// The drag behavior to open the drawer
  DragStartBehavior get drawerDragStartBehavior => DragStartBehavior.start;

  /// Whether the drawer can be opened with a drag gesture
  bool get drawerEnableOpenDragGesture => true;

  /// Whether the end drawer can be opened with a drag gesture
  bool get endDrawerEnableOpenDragGesture => true;

  Widget buildBody(BuildContext context, B bloc) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppbar(context, bloc),
      backgroundColor: backgroundColor,
      drawer: drawer(context, bloc),
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer(context, bloc),
      onEndDrawerChanged: onEndDrawerChanged,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      bottomNavigationBar: bottomNavigationBar(context, bloc),
      bottomSheet: bottomSheet(context, bloc),
      floatingActionButton: floatingActionButton(context, bloc),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons(context, bloc),
      persistentFooterAlignment: persistentFooterAlignment,
      primary: primary,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      restorationId: restorationId,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerDragStartBehavior: drawerDragStartBehavior,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      body: BlocProvider<B>(
        create: (context) => bloc,
        child: buildView(context, bloc),
      ),
    );
  }
}
