import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/bottomNav.dart';
import 'package:in_top/home_page.dart';

class internetChechker extends StatefulWidget{
  @override
  State<internetChechker> createState() => _internetChechkerState();
}

class _internetChechkerState extends State<internetChechker> {

  late ConnectivityResult result = ConnectivityResult.none ;
  late StreamSubscription subscription;
  var isConn = false;
  var p = 0;



@override
void initState(){
  super.initState();
  print('init called');
  checkConnection();
  startstreaming();
}


  checkConnection() async{
  print('checkConnction');
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none){
      isConn = true;


        setState(() {

        });

    }
    else{
      //isConn = false;
      showDialogbox();
      p = 1;
    }
    // setState(() {
    //
    // });
  }


  showDialogbox(){
  if(p == 1){
    Navigator.pop(context);
    p=0;
  }

    showDialog(
        barrierDismissible: false,
        context: context, builder: (context)=>CupertinoAlertDialog(
      title: Text('No Internet' , style: TextStyle(fontWeight: FontWeight.w800),),
      content: Text('Please Check Your Internet Connction'),
      actions: [
        CupertinoButton(child: Text('Retry'), onPressed:(){
          Navigator.pop(context);
          p=0;
          checkConnection();
          setState(() {

          });
        })
      ],
    ));
  }

  startstreaming(){
  print('streaming');
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      //Navigator.pop(context);
      checkConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
  //startstreaming();
    print('Internet build called');
     return isConn == true ? bottomNav() : Center(child: Container( height:30 , width:30,child: CircularProgressIndicator()));

    // Scaffold(
    //   appBar: (
    //     AppBar(
    //       title: Text('Connectivity checker'),
    //     )
    //   ),
    // );
  }
}