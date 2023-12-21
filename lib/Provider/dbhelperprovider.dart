import 'package:flutter/cupertino.dart';
import 'package:flutter_notes_app/Database/dbhelper.dart';
import 'package:flutter_notes_app/Models/note_model.dart';

class DbHelperProvider extends ChangeNotifier{
  DbHelper db =DbHelper.instance;
  List<NotesModel>arrNotes=[];

  fetchInitialData()async{
    arrNotes=await db.getNotes();
    notifyListeners();
  }

  List<NotesModel>getAllNotes(){
    fetchInitialData();
    return arrNotes;
  }

  addNotes(NotesModel notesModel)async{
    var check =await db.insertNotes(notesModel);
    if(check){
      arrNotes=await db.getNotes();
      notifyListeners();
    }
  }

  updateNotes(NotesModel notesModel)async{
    var check =await db.UpdateNotes(notesModel);
    if(check){
      arrNotes=await db.getNotes();
      notifyListeners();
    }
  }

  deleteNotes(int note_id)async{
    var check =await db.DeleteNotes(note_id);
    if(check){
      arrNotes =await db.getNotes();
      notifyListeners();

    }
  }




}


