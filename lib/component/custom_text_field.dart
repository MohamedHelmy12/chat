import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField.CustomFormField({this.hintText,this.onChange,this.obSecure=false}) ;
bool obSecure;
String? hintText;
Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecure!,
      validator: (data){
       if( data!.isEmpty){
         return 'field is required';
       }
      },
      onChanged: onChange,
      decoration: InputDecoration(

          enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )
          ) ,
          border: OutlineInputBorder(),
          hintText: hintText ,
        hintStyle:TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}
