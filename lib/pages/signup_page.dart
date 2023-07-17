import 'package:chat/constant.dart';
import 'package:chat/helper/show_snack+par.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../component/custom_button.dart';
import '../component/custom_text_field.dart';
import 'chat_page.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);
   static String id='SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   GlobalKey<FormState> formKey=GlobalKey();

   var email;

   var password;

   bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
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
                      'Sign Up',
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
                    text: 'Sign Up',
                    onTap: ()async{
                      isLoading=true;
                      setState(() {

                      });
                     if(formKey.currentState!.validate()){
                       try{
                         await registerUser();
                         Navigator.pushNamed(context, ChatPage.id);
                       }
                       on FirebaseAuthException catch(e){
                         if(e.code=='weak-password')
                           snackPar(context, 'weak password');
                       }
                       catch(e){
                         snackPar(context, 'error found');
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
                    Text('already have an account?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Text(
                      ' Sign in',
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

   Future<void> registerUser() async {
     UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email!, password: password!);
   }
}
