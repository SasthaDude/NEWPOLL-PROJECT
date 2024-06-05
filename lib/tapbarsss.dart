import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newpoll/thoughtsss.dart';

import 'firstpagesss.dart';
import 'homesss.dart';



class TabBarViewExample extends StatefulWidget {
  @override
  _TabBarViewExampleState createState() => _TabBarViewExampleState();
}

class _TabBarViewExampleState extends State<TabBarViewExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var dName= FirebaseAuth.instance.currentUser?.displayName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(dName != null && dName !="" ? "Welcome $dName" : "Welcome Alpha"
          ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
        ),
        actions: [
          IconButton(
              onPressed: (){
                try{
                  final GoogleSignIn _out= new GoogleSignIn();
                  _out.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const enter()));
                }
                catch(e)
                {
                  print(e);
                }
              },
              icon: Icon(Icons.logout, color: Colors.white,)
          )
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Tab(text: "Polling"),
            Tab(text: "News Feed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PollingPage(),
          NewsFeed(),
        ],
      ),
    );
  }
}





