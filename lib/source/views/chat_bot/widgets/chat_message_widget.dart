import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatefulWidget {
  final String message;
  final bool isReceiver;
  // final int? timeInSeconds;
  const ChatMessageWidget({
    Key? key,
    required this.message,
    this.isReceiver = false,
  }) : super(key: key);

  @override
  State<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.isReceiver ? Alignment.centerRight : Alignment.centerLeft,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          decoration: BoxDecoration(
            color: widget.isReceiver
                ? const Color(0xFF353767)
                : const Color(0xFF8394CA),
            borderRadius: widget.isReceiver
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
          alignment:
              widget.isReceiver ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
