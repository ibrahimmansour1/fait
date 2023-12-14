import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class BuildSendMessageWidget extends StatelessWidget {
  final TextEditingController? messageController;
  const BuildSendMessageWidget({super.key, this.messageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEFF5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tap here to send your message',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 20.fSize,
                    color: const Color(0xFF121212).withOpacity(0.5),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle send button press
              },
              icon: Icon(
                Icons.send_rounded,
                color: const Color(0xFF121212).withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
