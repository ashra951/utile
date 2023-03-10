import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/modules/shop_login/cubit/cubit.dart';
import 'package:untitled9/modules/shop_login/cubit/states.dart';
import 'package:untitled9/shared/components/compoenent.dart';

class shop_login extends StatelessWidget {
  const shop_login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formkey=GlobalKey<FormState>();
    var control1=TextEditingController();
    var control2=TextEditingController();
    return BlocProvider(create:(context) =>shop_logincub()  ,
      child: BlocConsumer<shop_logincub,states_shoplogin>(
        listener: (context, states_shoplogin) {

        },
        builder: (context, states_shoplogin) {
          var ob=shop_logincub.get(context);

          return Scaffold(
          appBar: AppBar(
            title: Text(
                "Shop App",

            ),
            titleSpacing: 10,


          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("LOGIN"
                      ,style: Theme.of(context).textTheme.headlineSmall
                      ),
                      SizedBox(height: 20,),
                      defultform(
                          control: control1,
                          ltext: "Enter the Email",
                          icon: Icon(Icons.email),
                          textInputType: TextInputType.emailAddress,
                          validate:(p0) {
                            if(p0!.isEmpty){
                              return "Enter the Email";
                            }
                            else return null;
                          },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defultform(
                          control: control2,
                          suficon: Icon(Icons.remove_red_eye),
                          is_pass: true,
                          ltext: "Enter the PAssword",
                          icon: Icon(Icons.password),
                          textInputType: TextInputType.visiblePassword,
                          validate: (p0) {
                            if(p0!.isEmpty){
                              return ("Enter the Password ");
                            }
                            else
                              return null;
                          },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          if(formkey.currentState!.validate()){
                            ob.user_login(emil: control1.text, passwprd: control2.text);
                            // ob.get_dio();

                            print(control1.text);
                            print(control2.text);
                          }

                        }, child: Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        );} ,


      ),
    );
  }
}
