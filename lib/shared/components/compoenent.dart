

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defultform({
   required TextEditingController ? control,
   required String ?ltext,
   required Icon icon,
   required TextInputType textInputType,
   Icon ?suficon,
   bool is_pass=false,
   required String? Function(String?)? validate,
   void Function()? ontap


})=>
TextFormField(
controller: control,
obscureText: is_pass,
   onTap: ontap,

keyboardType: textInputType,
validator:validate ,
decoration: InputDecoration(
labelText: ltext,
border: OutlineInputBorder  (),
prefixIcon: icon,
suffixIcon: suficon ,
labelStyle: TextStyle(
fontWeight: FontWeight.bold
)
),
);