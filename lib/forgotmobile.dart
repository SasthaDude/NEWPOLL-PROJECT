import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


import 'Createnewpass.dart';
import 'colorss.dart';

class forPass extends StatefulWidget {
  const forPass({super.key});

  @override
  State<forPass> createState() => _forPassState();
}

class _forPassState extends State<forPass> {

  final validateKKey = GlobalKey<FormState>();

  TextEditingController givePPhone = TextEditingController();

  final RegExp PhoneRRegExp =RegExp(r'^[0-9]{10}$');
  bool showOOtpField = false;
  bool otpCContainerTapped = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: validateKKey,
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: SingleChildScrollView(
              child: Column(
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
                  SizedBox(height: MediaQuery.of(context).size.height/15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number",
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: MediaQuery.of(context).size.height/17,),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (input) {
                          if(input == null || input.isEmpty){
                            return "Please enter your number";
                          }
                          if(input.length != 10){
                            return "Phone number should be 10 digits";
                          }
                        },
                        controller: givePPhone,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/17,),
                      if(showOOtpField)Column(
                        children: [
                          OtpTextField(
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            clearText: true,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/7,),
                          TextButton(
                            onPressed: (){},
                            child: Text("Resend OTP",
                                style: TextStyle(fontSize: 16.0, letterSpacing: 1,  fontFamily: "Poppins", color: Colors.white)),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/17,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => one()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/18,
                              width: MediaQuery.of(context).size.width/1,
                              decoration: BoxDecoration(
                                color: textPrimaryLightColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text("Continue",
                                    style:Theme.of(context).textTheme.headlineSmall),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/17,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(validateKKey.currentState!.validate()){
                              showOOtpField = true;
                              otpCContainerTapped = true;
                            }
                          });
                        },
                        child: Visibility(
                          visible: !otpCContainerTapped,
                          child: Container(
                            height: MediaQuery.of(context).size.height/18,
                            width: MediaQuery.of(context).size.width/1,
                            decoration: BoxDecoration(
                              color: textPrimaryLightColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text("OTP",
                                  style:Theme.of(context).textTheme.headlineSmall),
                            ),
                          ),
                        ),
                      ),


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
