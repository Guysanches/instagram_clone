import 'package:flutter/material.dart';

import 'app_constants.dart';

///Responsável por alterar o layout caso a largura seja maior que o valor webScreenSize
///Valor base utilizado 600

class AppResponsiveLayout extends StatefulWidget {
  final Widget mobileLayout;
  final Widget webLayout;

  const AppResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.webLayout,
  }) : super(key: key);

  @override
  State<AppResponsiveLayout> createState() => _AppResponsiveLayoutState();
}

class _AppResponsiveLayoutState extends State<AppResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.webLayout;
      }
      return widget.mobileLayout;
    });
  }
}
