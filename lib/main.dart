import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Screens/notes_app.dart';

void main(){
  runApp(NotesApp());
}
class NotesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes App",
      home: NotesAppScreen(),
    );
  }

}
