import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final bool isReceiver;
  // final int? timeInSeconds;
  const ChatMessageWidget({
    Key? key,
    required this.message,
    this.isReceiver = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        decoration: BoxDecoration(
          color: isReceiver ? const Color(0xFF353767) : const Color(0xFF8394CA),
          borderRadius: isReceiver
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
        ),
        alignment: isReceiver ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
