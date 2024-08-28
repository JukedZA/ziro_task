import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final bool removeTopPadding;
  const PageContainer({
    super.key,
    this.removeTopPadding = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 25, left: 25, bottom: 25, top: removeTopPadding ? 0 : 25),
      child: child,
    );
  }
}
