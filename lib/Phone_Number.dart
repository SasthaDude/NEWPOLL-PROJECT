


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colorss.dart';
import 'otp_screen.dart';

class otpPhone extends StatefulWidget {
  const otpPhone({super.key});

  @override
  State<otpPhone> createState() => _otpPhoneState();
}

class _otpPhoneState extends State<otpPhone> {

  final validateKey = GlobalKey<FormState>();
  late final String? verificationId;
  TextEditingController givePhone = TextEditingController();
  final phoneController = TextEditingController();
  final otpControllers = List.generate(6, (index) => TextEditingController());



  final RegExp PhoneRegExp =RegExp(r'^[0-9]{10}$');
  bool showOtpField = false;
  bool otpContainerTapped = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: validateKey,
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/17,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number",
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: MediaQuery.of(context).size.height/17,),
                      TextFormField(
                        maxLength: 15,
                        keyboardType: TextInputType.phone,
                        validator: (input) {
                          if(input == null || input.isEmpty){
                            return "Please enter your number";
                          }
                        },
                        controller: givePhone,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if(validateKey.currentState!.validate()){
                              showOtpField = true;
                              otpContainerTapped = true;
                            }
                          });
                          await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ext) {
                  print('Verification failed: $ext');
                },
                codeSent: (String verificationId, int? resendToken) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(verificationId: verificationId),
                    ),
                  );
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
                phoneNumber: givePhone.text.toString(),
              );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/18,
                          width: MediaQuery.of(context).size.width/1,
                          decoration: BoxDecoration(
                            color: textPrimaryLightColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(" Send OTP",
                                style:Theme.of(context).textTheme.headlineSmall),
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

