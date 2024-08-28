import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/custom/animations/ball_loading_animation.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BallAnimation(ballSize: 25),
    );
  }
}
