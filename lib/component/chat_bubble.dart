import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message
  }): super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          right: 32,
          left: 16,
          top: 32,
          bottom: 32,
        ),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: kPriparycolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight:Radius.circular(32) ,
              bottomRight: Radius.circular(32),
            )
        ),

        child: Text(
         message.message,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}

class ChatBubble2 extends StatelessWidget {
  const ChatBubble2({
    Key? key,
    required this.message
  }): super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          right: 32,
          left: 16,
          top: 32,
          bottom: 32,
        ),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight:Radius.circular(32) ,
              bottomRight: Radius.circular(32),
            )
        ),

        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
