import 'package:flutter/material.dart';

class ExtendedColorScheme {
  final ColorScheme colorScheme;
  final Color senderMessage;
  final Color receiverMessage;

  const ExtendedColorScheme({
    required this.colorScheme,
    required this.senderMessage,
    required this.receiverMessage,
  });

  factory ExtendedColorScheme.light({
    required Color senderMessage,
    required Color receiverMessage,
    required ColorScheme colorScheme,
  }) {
    return ExtendedColorScheme(
      colorScheme: colorScheme,
      senderMessage: senderMessage,
      receiverMessage: receiverMessage,
    );
  }

  factory ExtendedColorScheme.dark({
    required Color senderMessage,
    required Color receiverMessage,
    required ColorScheme colorScheme,
  }) {
    return ExtendedColorScheme(
      colorScheme: colorScheme,
      senderMessage: senderMessage,
      receiverMessage: receiverMessage,
    );
  }
}
