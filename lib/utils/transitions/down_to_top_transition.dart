import 'package:flutter/material.dart';


class SlideDownToTopPageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  final String? routeName;
  final Duration duration;

  SlideDownToTopPageRouteBuilder({
    required this.page,
    this.routeName,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Adjusted begin offset
            const end = Offset.zero; // End at the top
            var tween = Tween(begin: begin, end: end);
            var slideAnimation = animation.drive(tween);
            return SlideTransition(
              position: slideAnimation,
              child: child,
            );
          },
          transitionDuration: duration,
        );
}
