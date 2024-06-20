class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class LoadingMessage extends Message {
  LoadingMessage() : super(text: '...', isUser: false);
}
