import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Loginnn.dart';
import 'colorss.dart';

class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}
class _oneState extends State<one> {

  final validdd = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController Repassword = TextEditingController();

  final  RegExp NPassReg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final  RegExp RePassReg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Form(
        key: validdd,
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, size: 30, color: Colors.white,)),
                      SizedBox(width: 110,),
                      Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                          child: Image.network(
                              "https://i.pinimg.com/474x/49/cd/94/49cd949d1eaa1414f7649eaeb50519b3.jpg"
                          )),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/25,),
                  Text('Create New Password',
                    style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  TextFormField(
                    validator: (input){
                      if(input == null || input.isEmpty){
                        return "Please enter the Password";
                      }
                      if(!NPassReg.hasMatch(input)){
                        return "At least 1 uppercase, 1 lowercase, 1 special character, 1 digit";
                      }
                    },
                    decoration:const InputDecoration(
                        hintText: "New Password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20)
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  TextFormField(
                    validator: (input){
                      if(input == null || input.isEmpty){
                        return "Please enter the Password";
                      }
                      if(!RePassReg.hasMatch(input)){
                        return "At least 1 uppercase, 1 lowercase, 1 special character, 1 digit";
                      }
                    },
                    decoration:const InputDecoration(
                        hintText: "Re-enter Password",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20)
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  GestureDetector(
                    onTap: (){
                      if(validdd.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => looooo()));
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/18,
                      width: MediaQuery.of(context).size.width/1,
                      decoration: BoxDecoration(
                        color: textPrimaryLightColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text("Save",
                            style:Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}