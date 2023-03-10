

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/layout/todo/cubic/states.dart';
import 'package:untitled9/modules/archieve/Archieve.dart';
import 'package:untitled9/modules/done/Done.dart';

import '../../../modules/tasks/Tasks.dart';
import 'package:sqflite/sqflite.dart';
class todo_cubic extends Cubit<todo_states>{
  todo_cubic():super(intialcubic_state());
  static todo_cubic get(context)=>BlocProvider.of(context);
  int current_index=0;
  bool sheet_checked=false;
  List<Widget>screens=[
    Tasks(),
    Done(),
    Archieve()
  ];
  Database ?database;
  List<Map> Tasks_data=[];
  void change_index(index){
    current_index=index;
    emit(Bottomchangeindex());
  }
  void changesheet(value){
    sheet_checked=value;
    emit(sheet_statechange());
  }
  Future<Database?> create_database() async {
    database = await openDatabase("todoing.db", version: 1,

        onCreate: (Database db, int version)  {
          // When creating the db, create the table
           db.execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, name TEXT, date TEXT, time TEXT,status TEXT)'
           ).then((value) {
             print("the database created");
             emit(Create_db());

           }).catchError(
                   (e){
                     print("the error while creatis ${e.toString()}");

                   });
        },
      onOpen: (database) {

         get_data(database).then((value) {
          print(value);
        });

      },
      // onUpgrade: (db, oldVersion, newVersion) async {
      //
      //     // add a new column to the table
      //     await db.execute('ALTER TABLE Tasks ADD COLUMN status TEXT');
      //     print('doneeeeeee');
      //
      // },


        );
  }
  Future<int?> insertdb({required String name,required String date,required String time}) async{
    return await database?.insert("Tasks", {
      "name":name,
      "date":date,
      "time":time,
      "status":"true"


    }).then((value) {


      emit(insert_db());
      print(value);
      print ("the value has been inserted");
    });
  }
  Future<List<Map<String, Object?>>?> get_data(db)async{
    return await db?.query("Tasks").then((value)  {
      Tasks_data=value;
      print(Tasks_data);
      emit(get_db());
    });

  }




}