import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextField(TextEditingController controller, String text, IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: TextField(
        controller:  controller,
        decoration: InputDecoration(
          hintText:  text,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
  }
  static CustomAlertBox(BuildContext context,String title){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    });
  }



}
