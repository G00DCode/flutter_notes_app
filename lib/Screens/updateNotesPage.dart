import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Widgets/UiHelper.dart';
import 'package:provider/provider.dart';

import '../Models/note_model.dart';
import '../Provider/dbhelperprovider.dart';

class UpdateNotePage extends StatefulWidget{
  final NotesModel noteData;
  UpdateNotePage({required this.noteData});
  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  TextEditingController titleController= TextEditingController();
  TextEditingController descController= TextEditingController();

  UpdateData(String title, String desc,int noteId)async{
    if(title==""&&desc==""){
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");

    }
    else{
      context.read<DbHelperProvider>().updateNotes(NotesModel(id:noteId ,title: title, desc: desc));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update your Notes"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
          UiHelper.CustomTextField(descController, "Enter Description", Icons.description),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            UpdateData(titleController.text.toString(), descController.text.toString(),widget.noteData.id??0);
            Navigator.pop(context);

          }, child: Text("Update Notes")),

        ],
      ),
    );
  }
}
