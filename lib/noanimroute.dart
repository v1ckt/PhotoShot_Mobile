import 'package:flutter/material.dart';

class NoAnimationRoute<T> extends MaterialPageRoute<T> {
  NoAnimationRoute({required WidgetBuilder builder})
      : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}