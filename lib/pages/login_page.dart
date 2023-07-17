import 'package:chat/component/custom_button.dart';
import 'package:chat/component/custom_text_field.dart';
import 'package:chat/constant.dart';
import 'package:chat/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static String id='LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {

  var email;
var password;
bool isLoading=false;

GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor:kPriparycolor ,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Form(
            key: formKey,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Spacer(
                  flex: 2,
                ),
                Icon(Icons.ac_unit,
                  color: Color(0xffC7EDE6),
                  size: 80,
                ),
                Text(
                  'ScholarChat',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                  ),
                ),
                Spacer(flex: 1),
                Row(
                  children: [
                    Text(
                      'Sign in',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField.CustomFormField(
                  hintText: 'Email',
                  onChange: (value){
                    email=value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                CustomTextField.CustomFormField(
                  obSecure: true,
                  hintText: 'Password',
                  onChange: (value){
                    password=value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),


                CustomButton(
                    text: 'Sign In',
                    onTap: () async {
                      isLoading=true;
                      setState(() {

                      });
                     if(formKey.currentState!.validate()){
                       try {

                         await loginUser();
                         Navigator.pushNamed(context, ChatPage.id,arguments: email);
                       } on FirebaseAuthException catch (e) {
                         if (e.code == 'user-not-found') {
                           snackPar(context,'user not found');
                         } else if (e.code == 'wrong-password') {
                           snackPar(context, 'Wrong password provided for that user.');
                         }
                       }
                       catch(e){
                         snackPar(context, 'error is found');
                       }
                     }
                      isLoading=false;
                      setState(() {

                      });
                    }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('dont have an account?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, SignUp.id);
                    }, child: Text(
                      ' Sign up',
                      style: TextStyle(
                          fontSize: 17,
                        color: Color(0xffC7EDE6)
                      ),
                    ))
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snackPar(BuildContext context,String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('')));
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
  }
}
