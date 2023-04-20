

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/details.dart';
import 'package:in_top/home_page.dart';

var selectedindex = 0;

class trending extends StatefulWidget {
  trending(List trendingMovies);

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  //var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        height: 300,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: trendingMovies.length,
            itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  selectedindex = index;
                  setState(() {

                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return details(d:trendingMovies[index]);
                            // return  details(d:trendingMovies[index]['title']!= null ?trendingMovies[index]['title']:
                            // 'Loading...');
                          }));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10),

                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(//color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  child: Column(
                    children: [

                      Container(
                          // decoration: BoxDecoration(
                          //     boxShadow: [
                          //       BoxShadow(
                          //           //blurRadius: 1,
                          //           //offset: Offset(0 , 5)
                          //       )
                          //     ]
                          // ),
                          height: 180,
                          width: 150,

                          child:CachedNetworkImage(
                            placeholder: (context, url) => Container(
                                height: 10,
                                width: 10,
                                child: Center(child: const CircularProgressIndicator())
                            ),
                            imageUrl: 'https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}',
                            errorWidget: (context, url, error) => SizedBox(
                              width: 100,
                                height: 100,
                                child: Icon(Icons.error)),
                          ),


                          // SizedBox(
                          //   height: 50,
                          //   width: 50,
                          //   child: FadeInImage(
                          //       height: 50,
                          //       width: 50,
                          //       fadeInDuration: const Duration(milliseconds: 500),
                          //       fadeInCurve: Curves.easeInExpo,
                          //       fadeOutCurve: Curves.easeOutExpo,
                          //       placeholder: AssetImage("assets/images/common_screen/ic_default_image.jpg"),
                          //       image: NetworkImage(imageURL
                          //       ),
                          //       imageErrorBuilder: (context, error, stackTrace) {
                          //         return Container(child: Image.asset("assets/images/common_screen/ic_default_image.jpg"));
                          //       },
                          //       fit: BoxFit.cover),
                          // )


                          //Image(
                          //    image: NetworkImage('https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}'),
                          // )
                      ),

                      Container(

                        margin: EdgeInsets.only(top: 10),
                        color: selectedindex == index ?  Colors.blue : Colors.transparent,
                        width: 100,
                        height: 2,
                      ),




                      Container(

                        width: 100,
                        child: Text(
                          trendingMovies[index]['title']!= null ?trendingMovies[index]['title']:
                          trendingMovies[index]['name']!= null ?trendingMovies[index]['name']:
                          'Loading...', style: TextStyle(fontSize: 15),
                        ),
                      ),


                    ],
                  ),
                ),
              );
        }),
      ),
    );

  }
}





