import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scaffold_wrapper.dart';

/// A common scaffold widget that wraps the scaffold configuration and provides
/// a consistent layout structure across the app.
///
/// This widget is used to create a scaffold with common configuration options
/// that can be customized through the [ScaffoldWrapper].
///
/// Type parameter [B] extends [BlocBase] to support bloc-based state management.
class CommonScaffold<B extends BlocBase> extends StatelessWidget {
  /// The configuration wrapper that provides all scaffold-related settings and builders
  final ScaffoldWrapper<B> scaffoldConfig;

  /// The build context used for widget tree construction
  final BuildContext context;

  /// The bloc instance used for state management
  final B bloc;

  /// Creates a [CommonScaffold] widget.
  ///
  /// Requires a [scaffoldConfig] to define the scaffold's structure and behavior,
  /// a [context] for widget building, and a [bloc] for state management.
  ///
  /// The [key] parameter is optional and can be used to maintain state across
  /// widget rebuilds.
  const CommonScaffold({
    required this.scaffoldConfig,
    required this.context,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldConfig.scaffoldKey,
      appBar: scaffoldConfig.buildAppbar(context, bloc),
      backgroundColor: scaffoldConfig.backgroundColor,
      drawer: scaffoldConfig.drawer(context, bloc),
      onDrawerChanged: scaffoldConfig.onDrawerChanged,
      endDrawer: scaffoldConfig.endDrawer(context, bloc),
      onEndDrawerChanged: scaffoldConfig.onEndDrawerChanged,
      extendBody: scaffoldConfig.extendBody,
      extendBodyBehindAppBar: scaffoldConfig.extendBodyBehindAppBar,
      bottomNavigationBar: scaffoldConfig.bottomNavigationBar(context, bloc),
      bottomSheet: scaffoldConfig.bottomSheet(context, bloc),
      floatingActionButton: scaffoldConfig.floatingActionButton(context, bloc),
      floatingActionButtonLocation: scaffoldConfig.floatingActionButtonLocation,
      floatingActionButtonAnimator: scaffoldConfig.floatingActionButtonAnimator,
      persistentFooterButtons: scaffoldConfig.persistentFooterButtons(
        context,
        bloc,
      ),
      persistentFooterAlignment: scaffoldConfig.persistentFooterAlignment,
      primary: scaffoldConfig.primary,
      resizeToAvoidBottomInset: scaffoldConfig.resizeToAvoidBottomInset,
      restorationId: scaffoldConfig.restorationId,
      drawerScrimColor: scaffoldConfig.drawerScrimColor,
      drawerEdgeDragWidth: scaffoldConfig.drawerEdgeDragWidth,
      drawerDragStartBehavior: scaffoldConfig.drawerDragStartBehavior,
      drawerEnableOpenDragGesture: scaffoldConfig.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture:
          scaffoldConfig.endDrawerEnableOpenDragGesture,
      body: scaffoldConfig.buildView(context, bloc),
    );
  }
}
