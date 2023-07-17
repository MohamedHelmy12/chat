import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ScholarChat());
}

class ScholarChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
         SignUp.id:(context)=>SignUp(),
         LoginPage.id : (context)=>LoginPage(),
         ChatPage.id:(context)=>ChatPage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute:LoginPage.id ,
    );
  }
}


