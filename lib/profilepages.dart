import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorss.dart';

class proAlpha extends StatefulWidget {
  const proAlpha({super.key});

  @override
  State<proAlpha> createState() => _proAlphaState();
}

class _proAlphaState extends State<proAlpha> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ima/backc.jpg"),
              fit: BoxFit.fill
              ),
            ),
          ),
          //backgroundColor: Colors.red,
          toolbarHeight: 50,
          leading: IconButton(onPressed: () {
            setState(() {
              Navigator.pop(context
              );
            });
          },
            icon: Icon(Icons.arrow_back, color: Colors.white,),

          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: "Poppins",
              )
              ),
              Text("402k posts", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: "Poppins",
              ),),
            ],
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54
                    ),
                    child: Icon(Icons.search_rounded, color: Colors.white,
                    size: 30,)),
                SizedBox(width: 25,),
                Container(
                  height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54
                    ),
                    child: Icon(Icons.more_vert, color: Colors.white, size: 30,)),
              ],
            )
          ],
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text("Alpha", style: mViewEditTextStyle),
                      Icon(Icons.verified, color: Colors.blue,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
