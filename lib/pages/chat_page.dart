
import 'package:chat/constant.dart';
import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../component/chat_bubble.dart';

class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);
 static String id='ChatPage';
 ScrollController _controller=ScrollController();
   TextEditingController controller=TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);

  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt,descending:true ).snapshots(),
        builder: (context, snapshot) {
       if(snapshot.hasData){
         List<Message> messageList=[];
         for(int i=0;i< snapshot.data!.docs.length; i++){
           messageList.add(Message.fromJson(snapshot.data!.docs[i]));
         }
    return Scaffold(
    appBar: AppBar(
    backgroundColor: kPriparycolor,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(
    'Chat',


    ),
    ),
    body:Column(
    children: [
    Expanded(
    child: ListView.builder(
      reverse: true,
      controller:_controller ,
    itemCount: messageList.length,
    itemBuilder:(context, index) {
     if (email == messageList[index].id) {
      return ChatBubble(message: messageList[index]);
     }
     else {
      return ChatBubble2(message: messageList[index]);
     }
    }
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(16),
    child: TextField(
    controller: controller,
    onSubmitted: (data){
    messages.add(
    {
    kMessage : data ,
    kCreatedAt :DateTime.now(),
    'id':email
    }
    );
    controller.clear();
    _controller.animateTo(
       0 , duration: Duration(milliseconds: 500), curve: Curves.linear);
    },

    decoration: InputDecoration(
    hintText: 'send message',
    suffixIcon: Icon(
    Icons.send,
    color: kPriparycolor,
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
    color: kPriparycolor,

    )
    ),
    ),
    ),
    )
    ],
    ) ,
    );}
       return Text('is loading...');
        }

    );
  }
}

