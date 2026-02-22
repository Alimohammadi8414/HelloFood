import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScafolld;
  final Widget tabletScafolld;
  final Widget desktopScafolld;

  const ResponsiveLayout({
    super.key,
    required this.mobileScafolld,
    required this.tabletScafolld,
    required this.desktopScafolld,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScafolld;
        } else if (constraints.maxWidth < 1100) {
          return tabletScafolld;
        } else {
          return desktopScafolld;
        }
      },
    );
  }
}
