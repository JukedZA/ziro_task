import 'package:flutter/material.dart';
import 'package:transaction_management_app/main.dart';

get getContext => navigatorKey.currentState?.overlay?.context;

class RouteHelper {
  Future push(
    Widget widget, {
    bool isNewTask = false,
    Duration? duration,
  }) async {
    if (isNewTask) {
      return await Navigator.of(getContext).pushAndRemoveUntil(
        buildPageRoute(child: widget),
        (route) => false,
      );
    } else {
      return await Navigator.of(getContext).push(
        buildPageRoute(child: widget),
      );
    }
  }

  static Route buildPageRoute({required Widget child, Duration? duration}) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => child,
      transitionsBuilder: (c, anim, a2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
          ).animate(anim),
          child: child,
        );
      },
      transitionDuration: duration ?? const Duration(milliseconds: 250),
    );
  }
}
