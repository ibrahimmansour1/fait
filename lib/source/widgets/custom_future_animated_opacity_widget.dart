import 'dart:async';
import 'package:flutter/material.dart';

class CustomFutureAnimatedOpacityWidget extends StatefulWidget {
  final Widget child;
  int waitingDurationInMilliSeconds;
  Duration animationDuration;
  CustomFutureAnimatedOpacityWidget({
    Key? key,
    required this.child,
    this.waitingDurationInMilliSeconds = 1000,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _CustomFutureAnimatedOpacityWidgetState createState() =>
      _CustomFutureAnimatedOpacityWidgetState();
}

class _CustomFutureAnimatedOpacityWidgetState
    extends State<CustomFutureAnimatedOpacityWidget> {
  final Completer<void> _completer = Completer<void>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.waitingDurationInMilliSeconds),
        () => _completer.complete());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _completer.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox
                .shrink(); // Return an empty widget while waiting
          } else if (snapshot.connectionState == ConnectionState.done) {
            return AnimatedOpacity(
                opacity: 1,
                duration: widget.animationDuration,
                child: widget.child);
          } else {
            return AnimatedOpacity(
                opacity: 0,
                duration: widget.animationDuration,
                child: widget.child);
          }
        });
  }
}
