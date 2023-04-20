//import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'details.dart';

var trendingMovies = [];
var tvm = [];
var apikey = '0a58ea19cac36cd554712b375c479a78';
var accestoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTU4ZWExOWNhYzM2Y2Q1NTQ3MTJiMzc1YzQ3OWE3OCIsInN1YiI6IjY0Mzc4NTlmMzdiM2E5MDBmMzJiMDMzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.etMx8baB5ubTPwMrGTKyJNreoctraR9XlQWuWSaxbP8';

late Future myFutuer;

class my_homepage extends StatefulWidget{

  @override
  State<my_homepage> createState() => _my_homepageState();
}

class _my_homepageState extends State<my_homepage> {
  loadMovie()async{
    print('yadav');
    TMDB tmdb = TMDB(ApiKeys(apikey , accestoken),
      logConfig: ConfigLogger(
        showLogs: true,//must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
    Map result = await tmdb.v3.trending.getTrending();
    Map tv = await tmdb.v3.tv.getPopular();
    //print(result);
    trendingMovies = result['results'];
    tvm = tv['results'];
    //print(trendingMovies[0]);
    setState(() {

    });
    return 1;
  }

  //late Future myFutuer;

  @override
  void initState(){
    super.initState();
    myFutuer = loadMovie();
  }

  int crrIndex = 0;

  @override
  Widget build(BuildContext context) {


    //loadMovie();

    return FutureBuilder(
        future: myFutuer,

        builder: (ctx, snapshot) {
          print('future builder called');
      //if (snapshot.connectionState == ConnectionState.done) {
      if(snapshot.hasData){
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Center(child: Text('Trending Movies' , style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.white60,
        ),
        body:  Container(
          color: Colors.black12,
            child: Column(
              children: [

                Expanded(
                  flex: 3,

                  child: trending(trendingMovies),
                ),

                Expanded(
                  flex:4,

                  child: Container(
                    width: double.infinity,
                    
                    margin: EdgeInsets.only(left: 4 , right: 4),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30))
                      ,color: Colors.white ,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset(10 , 0)
                        )
                      ]

                    ),
                    child: Column(
                      children: [
                        Flexible(child: (
                        Container(
                          margin: EdgeInsets.only(top: 10 , bottom: 10),
                          width: 200,
                          height: MediaQuery.of(context).size.height*.04,
                          //height: 20,
                          //height: MediaQuery.of(context).size.height*.5,
                          //color: Colors.black,
                          child: Center(child: Text('Trending TV Shows' , style: TextStyle(color: Colors.black))),
                        )
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.4,
                          //height: 300,
                          child: Container(
                            margin: EdgeInsets.only(left: 10 , right: 10),
                            color: Colors.black12,
                            child: PageView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: tvm.length,
                                itemBuilder: (context , index){
                              return Center(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context){
                                              return  details(d:tvm[index]);
                                            }));
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.all(90),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.elliptical(10, 20)),
                                      boxShadow:[
                                        BoxShadow(
                                          blurRadius: 20,
                                          offset: Offset(10 , 10)


                                        )
                                      ]
                                    ),

                                    width: 200,
                                    height: 200,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) => Center(
                                            child: Container(
                                                height: 10,
                                                width: 10,
                                                child: const CircularProgressIndicator())),
                                        imageUrl: 'https://image.tmdb.org/t/p/w500${tvm[index]['poster_path']}',
                                        errorWidget: (context, url, error) => SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Icon(Icons.error)),
                                      ),

                                      //Image.network('https://image.tmdb.org/t/p/w500${tvm[index]['poster_path']}')


                                    //color: Colors.white,
                                  ),
                                ),
                              );
                            }),

                          ),
                        )

                      ],
                    ),

                  ),
                )
              ],
            ),
          ),

        ),
    );}
      else{
        myFutuer = loadMovie();
        // setState(() {
        //
        // });
    return Center(child: CircularProgressIndicator());
    }

  }
    );
  }
}

