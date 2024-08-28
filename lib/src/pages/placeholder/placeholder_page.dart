import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HeadingText(text: 'Oops! Nothing here'),
      ),
    );
  }
}
