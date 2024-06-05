// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//
//
// import 'Loginnn.dart';
// import 'colorss.dart';
//
// class otpPhone extends StatefulWidget {
//   const otpPhone({super.key});
//
//   @override
//   State<otpPhone> createState() => _otpPhoneState();
// }
//
// class _otpPhoneState extends State<otpPhone> {
//
//   final validateKey = GlobalKey<FormState>();
//   late final String? verificationId;
//   TextEditingController givePhone = TextEditingController();
//   final phoneController = TextEditingController();
//   final otpControllers = List.generate(6, (index) => TextEditingController());
//
//
//
//   final RegExp PhoneRegExp =RegExp(r'^[0-9]{10}$');
//   bool showOtpField = false;
//   bool otpContainerTapped = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Form(
//         key: validateKey,
//         child: Padding(
//           padding: const EdgeInsets.all(27.0),
//           child: SafeArea(
//             maintainBottomViewPadding: true,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                           child: Icon(Icons.arrow_back, size: 30, color: Colors.white,)),
//                       SizedBox(width: 110,),
//                       Container(
//                         height: MediaQuery.of(context).size.height/10,
//                         width: MediaQuery.of(context).size.width/4,
//                         child: Image.network(
//                             "https://i.pinimg.com/474x/49/cd/94/49cd949d1eaa1414f7649eaeb50519b3.jpg"
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height/17,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Phone Number",
//                           style: Theme.of(context).textTheme.titleLarge),
//                       SizedBox(height: MediaQuery.of(context).size.height/17,),
//                       TextFormField(
//                         maxLength: 15,
//                         keyboardType: TextInputType.phone,
//                         // inputFormatters: [
//                         //   FilteringTextInputFormatter.,
//                         // ],
//                         validator: (input) {
//                           if(input == null || input.isEmpty){
//                             return "Please enter your number";
//                           }
//                           // if(input.length != 10){
//                           //   return "Phone number should be 10 digits";
//                           // }
//                         },
//                         controller: givePhone,
//                         decoration: InputDecoration(
//                             hintText: "Phone Number",
//                             hintStyle: Theme.of(context).textTheme.displayLarge
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height/17,),
//                       if(showOtpField)Column(
//                         children: [
//                           OtpTextField(
//                             numberOfFields: 6,
//                             showFieldAsBox: true,
//                             clearText: true,
//                           ),
//                           SizedBox(height: MediaQuery.of(context).size.height/17,),
//                           TextButton(
//                             onPressed: (){},
//                             child: Text("Resend OTP",
//                                 style: TextStyle(fontSize: 16.0, letterSpacing: 1,  fontFamily: "Poppins", color: Colors.white)),
//                           ),
//                           SizedBox(height: MediaQuery.of(context).size.height/17,),
//                           GestureDetector(
//                             onTap: () async {
//                               try {
//                                 String otp = otpControllers.map((controller) => controller.text).join();
//                                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                                   verificationId: givePhone.text,
//                                   smsCode:otp,
//                                 );
//                                 await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => looooo()));
//                                 });
//                               } catch (ex) {
//                                 log(ex.toString());
//                               }
//                             },
//                             child: Container(
//                               height: MediaQuery.of(context).size.height/18,
//                               width: MediaQuery.of(context).size.width/1,
//                               decoration: BoxDecoration(
//                                 color: textPrimaryLightColor,
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: Center(
//                                 child: Text("Continue",
//                                     style:Theme.of(context).textTheme.headlineSmall),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height/17,),
//                       GestureDetector(
//                         onTap: () async {
//                           setState(() {
//                             if(validateKey.currentState!.validate()){
//                               showOtpField = true;
//                               otpContainerTapped = true;
//                             }
//                           });
//                           await FirebaseAuth.instance.verifyPhoneNumber(
//                             verificationCompleted: (PhoneAuthCredential credential) {},
//                             verificationFailed: (FirebaseAuthException ext) {
//                               print('Verification failed: $ext');
//                             },
//                             codeSent: (String verificationId, int? resendToken) {
//                             },
//                             codeAutoRetrievalTimeout: (String verificationId) {},
//                             phoneNumber: givePhone.text.toString(),
//                           );
//                         },
//                         child: Visibility(
//                           visible: !otpContainerTapped,
//                           child: Container(
//                             height: MediaQuery.of(context).size.height/18,
//                             width: MediaQuery.of(context).size.width/1,
//                             decoration: BoxDecoration(
//                               color: textPrimaryLightColor,
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Center(
//                               child: Text("OTP",
//                                   style:Theme.of(context).textTheme.headlineSmall),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
