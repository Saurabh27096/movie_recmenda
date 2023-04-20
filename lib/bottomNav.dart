import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/about.dart';
import 'package:in_top/home_page.dart';
import 'package:in_top/watchList.dart';

class bottomNav extends StatefulWidget{
  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int currIndex = 0;
  var navList = [
    my_homepage() ,
    watchList(),
    about()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navList[currIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later),
              label: 'Watch List',
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'About',
              backgroundColor: Colors.yellow
          )
        ],
        onTap: (index){
          setState(() {
            currIndex = index;
          });
        },

      ),


    );
  }
}