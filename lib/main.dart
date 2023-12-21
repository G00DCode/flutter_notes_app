import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Provider/dbhelperprovider.dart';
import 'package:flutter_notes_app/Screens/notes_app.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(NotesApp());
}
class NotesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>DbHelperProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Notes App",
        home: NotesAppScreen(),
      ),
    );
  }

}
