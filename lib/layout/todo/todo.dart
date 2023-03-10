


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../shared/components/compoenent.dart';
import 'cubic/cubit.dart';
import 'cubic/states.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scafkey=GlobalKey<ScaffoldState>();
    var formkey=GlobalKey<FormState>();
    TextEditingController control1=TextEditingController();
    TextEditingController control2=TextEditingController();
    TextEditingController control3=TextEditingController();
    var check_sheet=false;

    return BlocProvider(create: (context) => todo_cubic()..create_database(),
      child: BlocConsumer<todo_cubic,todo_states>(listener:(context, todo_states) {

      },
        builder: (context, todo_states) {
          var ob=todo_cubic.get(context);

      return  Scaffold
        (key:scafkey ,
        appBar: AppBar(
          title: Text(
            'Todo',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold

            ),

          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: (){


            if(ob.sheet_checked==false){
              scafkey.currentState?.showBottomSheet((context) => Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defultform(
                            icon: Icon(Icons.text_fields),
                            validate: (p0) {
                              if(p0!.isEmpty){
                                return"Enter the Text ,Please";
                              }
                              else
                              {  return null;}

                            },
                            ltext: "Enter The Text",
                            textInputType:TextInputType.text,
                            control: control1


                        ),
                        defultform(
                            icon: Icon(Icons.watch_later_outlined),
                            validate: (p0) {
                              if(p0!.isEmpty){
                                return"Enter the Task time,Please";
                              }
                              else
                              {  return null;}

                            },
                            ltext: "Enter The Enter the Task time",
                            textInputType:TextInputType.datetime,
                            control: control2,
                            ontap: (){
                              showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
                                      (value) {
                                    control2.text=value!.format(context).toString();
                                  }
                              );


                            }
                        ),
                        defultform(
                            icon: Icon(Icons.calendar_month),
                            ontap: (){
                              showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime.now(), lastDate: DateTime.parse("2025-01-01")

                              ).then((value) {
                                control3.text=DateFormat.yMMM().format(value!).toString();
                              });
                            },
                            validate: (p0) {
                              if(p0!.isEmpty){
                                return"Enter the Date ,Please";
                              }
                              else
                              {  return null;}

                            },
                            ltext: "Enter The Date",
                            textInputType:TextInputType.datetime,
                            control: control3
                        ),



                      ],
                    ),
                  ),
                ),
              )).closed.then((value) {


                ob.changesheet(false);
              });
              ob.changesheet(true);


            }
            else{
              if(formkey.currentState!.validate())  {

                 ob.insertdb(name: control1.text, date: control2.text, time: control3.text).then((value) {
                   print ("entered");
                   control1.clear();
                   control2.clear();
                   control3.clear();
                   Navigator.pop(context);
                   ob.changesheet(false);
                   ob.get_data(ob.database);


                 }).catchError((e){
                   print(e.toString());
                 });







              }

              
            }
          },

         
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ob.current_index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: (value){
            ob.change_index(value);

          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: "Done",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: "Archieve",
            )



          ],
        ),
        body: ConditionalBuilder(builder: (context) =>  ob.screens[ob.current_index],
          condition: true,
          fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
      ) ;
      }

      ),
    );
  }
}
