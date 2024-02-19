import 'package:flutter/material.dart';

import '../constants.dart';

class FadePageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  FadePageRouteBuilder({
    required this.page,
    this.duration = animationDuration,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            var tween = Tween(begin: begin, end: end);
            var fadeAnimation = animation.drive(tween);
            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
          transitionDuration: duration,
          
        );
}
