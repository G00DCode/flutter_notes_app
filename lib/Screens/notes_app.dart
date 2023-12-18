import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/Database/dbhelper.dart';
import 'package:flutter_notes_app/Models/note_model.dart';
import 'package:flutter_notes_app/Widgets/UiHelper.dart';

class NotesAppScreen extends StatefulWidget{
  @override
  State<NotesAppScreen> createState() => _NotesAppScreenState();
}

class _NotesAppScreenState extends State<NotesAppScreen> {
  TextEditingController titleController= TextEditingController();
  TextEditingController descController= TextEditingController();
  late DbHelper dbHelper;
  List<NotesModel>fetchNotesList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper =DbHelper.instance;
  }
  getAllNotes()async{
    fetchNotesList= await dbHelper.getNotes();
    setState(() {
      //to show data in ui that's why set state called
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showModalBottomSheet();

        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            titleController.text=fetchNotesList[index].title;
            descController.text=fetchNotesList[index].desc;
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomTextField(titleController, "Title", Icons.title),
                      UiHelper.CustomTextField(descController, "Description", Icons.description),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        var utitle= titleController.text.toString();
                        var udesc= descController.text.toString();
                        dbHelper.UpdateNotes(NotesModel(title: utitle, desc: udesc));
                      }, child: Text("Update")),



                    ],
                  ),
                ),
              );

            }
            );},
          child: ListTile(
            leading: Text("${fetchNotesList[index].id}"),
            title: Text("${fetchNotesList[index].title}"),
            subtitle: Text("${fetchNotesList[index].desc}"),
            trailing: IconButton(
              onPressed: ()async{
                await dbHelper.DeleteNotes(fetchNotesList[index].id!);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        );
      }),
    );
  }
  _showModalBottomSheet(){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 600,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomTextField(titleController, "Title", Icons.title),
              UiHelper.CustomTextField(descController, "Description", Icons.description),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                dbHelper.addNotes(NotesModel(title: titleController.text.toString(), desc: descController.text.toString()));
                setState(() {
                  getAllNotes();
                });
              }, child: Text("Save")),

            ],
          ),
        ),
      );
    });

  }
}
