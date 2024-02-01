import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class BuildSendMessageWidget extends StatefulWidget {
  final TextEditingController? messageController;
  final Function()? onTap;
  const BuildSendMessageWidget({super.key, this.messageController, this.onTap});

  @override
  State<BuildSendMessageWidget> createState() => _BuildSendMessageWidgetState();
}

class _BuildSendMessageWidgetState extends State<BuildSendMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEFF5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 5.v),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Tap here to send your message',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 20.fSize,
                    color: const Color(0xFF121212).withOpacity(0.5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: widget.onTap,
                    icon: Icon(
                      Icons.send_rounded,
                      color: const Color(0xFF121212).withOpacity(0.5),
                    ),
                  ),
                ),
                controller: widget.messageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
