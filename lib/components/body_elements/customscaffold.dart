import 'package:flutter/material.dart';

class CustomScaffold extends Scaffold {
  const CustomScaffold({
    Key? key,
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? bottomNavigationBar,
    // outros parâmetros conforme necessário
  }) : super(
          key: key,
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          extendBodyBehindAppBar: true,
          extendBody: true,
          // outros parâmetros conforme necessário
        );
}