import 'package:flutter/material.dart';

class CustomFutureAnimatedOpacityWidget extends StatelessWidget {
  final Widget child;
  int waitingDurationInMilliSeconds;
  Duration animationDuration;
  CustomFutureAnimatedOpacityWidget({
    super.key,
    required this.child,
    this.waitingDurationInMilliSeconds = 1000,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
            Duration(milliseconds: waitingDurationInMilliSeconds)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AnimatedOpacity(
                opacity: 0, duration: animationDuration, child: child);
          }
          return AnimatedOpacity(
              opacity: 1, duration: animationDuration, child: child);
        });
  }
}
