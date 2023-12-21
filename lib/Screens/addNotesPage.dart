import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Widgets/UiHelper.dart';
import 'package:provider/provider.dart';

import '../Models/note_model.dart';
import '../Provider/dbhelperprovider.dart';

class AddNotesPages extends StatefulWidget{
  @override
  State<AddNotesPages> createState() => _AddNotesPagesState();
}

class _AddNotesPagesState extends State<AddNotesPages> {
  TextEditingController titleController= TextEditingController();
  TextEditingController descController= TextEditingController();

  addData(String title, String desc)async{
    if(title==""&&desc==""){
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");

    }
    else{
      context.read<DbHelperProvider>().addNotes(NotesModel(title: title, desc: desc));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your Notes"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
          UiHelper.CustomTextField(descController, "Enter Description", Icons.description),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            addData(titleController.text.toString(), descController.text.toString());
            Navigator.pop(context);

          }, child: Text("Add Notes")),

        ],
      ),
    );
  }
}
