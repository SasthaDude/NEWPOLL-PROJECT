import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'OTPphone.dart';
import 'Phone_Number.dart';


class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {

  final validatorKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]+$');
  final  RegExp PassRReg = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
  final RegExp PhoneRegExp =RegExp(r'^[0-9]{10}$');



  TextEditingController giveName = TextEditingController();
  TextEditingController giveEmail = TextEditingController();
  TextEditingController givePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: validatorKey,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: MediaQuery.of(context).size.height/15,),
                      Text("Create your account",
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),

                      TextFormField(
                        validator: (input) {
                          if(input == null || input.isEmpty){
                            return "Please enter your name";
                          }
                          if(input.length<3){
                            return "Name should be 4 letters";
                          }
                        },
                        controller: giveName,
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),
                      TextFormField(
                        validator: (input) {
                          if(!emailRegex.hasMatch(input!)){
                            return "Please enter the valid email";
                          }
                        },
                        controller: giveEmail,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),
                      TextFormField(
                        validator: (input){
                          if(input == null || input.isEmpty){
                            return "Please enter the Password";
                          }
                          // if(!PassRReg.hasMatch(input)){
                          //   return "At least 1 uppercase, 1 lowercase, 1 special character, 1 digit";
                          // }
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye_outlined)
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/6,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue.shade100,),
                            ),
                            onPressed: (){
                              setState(() {
                                if(validatorKey.currentState!.validate()){
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => otpPhone(),
                                      ));
                                }
                              });
                            },
                            child: Text("Next",
                              style: Theme.of(context).textTheme.headlineMedium,)),
                      )
                    ],
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