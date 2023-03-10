import 'package:flutter/material.dart';

import '../../shared/components/compoenent.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var controller1=TextEditingController();
  var controller2=TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){

          },

        ),
        title: Text(
          "Testing"
        ),
        actions: [
          Icon(Icons.alarm),
          SizedBox(width: 20,)
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Form(
            key: formkey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 30,
                ),defultform(
                  control: controller1,
                  icon: Icon(Icons.email),
                  ltext: "Enter the Email",
                  textInputType: TextInputType.emailAddress,
                    validate:( p0) {

          if (p0!.isEmpty) {
          return "please Enter the Email";
          } else {
          return null;
          }

          }),

                SizedBox(
                  height: 30,
                ),defultform(
                  textInputType: TextInputType.visiblePassword,
                  ltext: "Enter the Password",
                  icon: Icon(Icons.password),
                  control: controller2,
                  suficon: Icon(Icons.remove_red_eye),
                  is_pass: true,
                  validate: (p0) {

                      if (p0!.isEmpty) {
                        return "please Enter the Password";
                      } else {
                        return null;
                      }

                  }),

                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      print(controller1.text);
                      print(controller2.text);
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
    );
  }
}
