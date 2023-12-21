import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Provider/dbhelperprovider.dart';
import 'package:flutter_notes_app/Screens/addNotesPage.dart';
import 'package:flutter_notes_app/Screens/updateNotesPage.dart';
import 'package:provider/provider.dart';

class NotesAppScreen extends StatefulWidget{
  @override
  State<NotesAppScreen> createState() => _NotesAppScreenState();
}

class _NotesAppScreenState extends State<NotesAppScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotesPages()));

        },
        child: Icon(Icons.add),
      ),
      body:Consumer<DbHelperProvider>(builder: (_,provider,__){
          return ListView.builder(itemBuilder: (_,index){
            var currentData=provider.getAllNotes()[index];

            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNotePage(noteData: currentData,)));
              },

              child: ListTile(
                leading: Text("${currentData.id}"),
                title: Text("${currentData.title}"),
                subtitle: Text("${currentData.desc}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    if (currentData.id != null) {
                      await provider.deleteNotes(currentData.id!);
                    }
                  },

                ),
              ),
            );
          },itemCount: provider.getAllNotes().length);

      },),
    );
  }
}
