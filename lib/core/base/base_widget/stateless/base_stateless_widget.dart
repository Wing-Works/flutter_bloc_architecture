import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStatelessWidget<B extends BlocBase<dynamic>> extends Widget {
  const BaseStatelessWidget(this.bloc, {required super.key});

  final B bloc;

  @protected
  Widget build(BuildContext context, B model);

  @override
  DataProviderElement<B> createElement() => DataProviderElement<B>(this, bloc);
}

class DataProviderElement<B extends BlocBase<dynamic>>
    extends ComponentElement {
  DataProviderElement(BaseStatelessWidget super.widget, this._bloc);

  final B _bloc;

  @override
  late final BaseStatelessWidget widget = super.widget as BaseStatelessWidget;

  @override
  Widget build() => widget.build(this, _bloc);
}
