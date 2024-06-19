import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:fait/source/theme/extended_color_schemes.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessageWidget extends ConsumerStatefulWidget {
  final String message;
  final bool isReceiver;
  // final int? timeInSeconds;
  const ChatMessageWidget({
    Key? key,
    required this.message,
    this.isReceiver = false,
  }) : super(key: key);

  @override
  ConsumerState<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends ConsumerState<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.read(themeNotifierProvider);
    final senderColor = ColorSchemes.senderMessage;
    final receiverColor = ColorSchemes.receiverMessage;
    return Align(
      alignment:
          widget.isReceiver ? Alignment.centerRight : Alignment.centerLeft,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          decoration: BoxDecoration(
            color: widget.isReceiver ? receiverColor : senderColor,
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
              style: TextStyle(
                fontSize: 16,
                color: !widget.isReceiver
                    ? Colors.white
                    : ThemeHelper().getThemeData().colorScheme.tertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
