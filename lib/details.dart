import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/addMovie.dart';

import 'backImageAndRating.dart';

class details extends StatelessWidget {
  var d;
  details({this.d});




  @override
  Widget build(BuildContext context) {
    //print(d.runtimeType);
    Size size = MediaQuery.of(context).size; // total size of the screen

    return Scaffold(
      backgroundColor: Colors.white60,
      // appBar: AppBar(
      //   title: Text(d),
      // ),
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: [
             backImageAndRating(size:size , movie:d),
             SizedBox(
               height: 20,
             ),
             addMovie(movie:d),
             SizedBox(
               height: 20,
             ),

             Container(
               padding: EdgeInsets.all(20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(30)),

               ),
               child: Text(d['overview'] , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w100),),

             )

           ],
         ),
       ),
     ),
    );
  }
}


