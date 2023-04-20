import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/provider1.dart';
import 'package:provider/provider.dart';

import 'details.dart';

class watchList extends StatefulWidget{
  @override
  State<watchList> createState() => _watchListState();
}

class _watchListState extends State<watchList> {
   var selectedindex = 0;


  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;

    final watchlist = Provider.of<watchListProvider>(context);
    var key = watchlist.words.keys.toList();
    var words = watchlist.words;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Watchlist')),
      ),
      body:words.length > 0 ? Padding(

        padding: const EdgeInsets.only(left: 8 , right: 8 , bottom: 8 , top: 2),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (size.width/size.height),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,



              crossAxisCount: 3
          ),
          itemCount: words.length,
          itemBuilder: (context , index){


            //print(size);
            return InkWell(
              onTap: (){
                selectedindex = index;
                setState(() {

                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return details(d:words[key[index]]);
                          // return  details(d:trendingMovies[index]['title']!= null ?trendingMovies[index]['title']:
                          // 'Loading...');
                        }));
              },
              child: Container(
                //padding: EdgeInsets.only(top: 10),

                //margin: EdgeInsets.only(right: 10),
                // decoration: BoxDecoration(//color: Colors.green,
                //   //borderRadius: BorderRadius.all(Radius.circular(30)),
                //
                // ),
                child: SingleChildScrollView(
                  //reverse: true,
                  child: Column(
                    children: [

                      Container(
                        //color: Colors.red,
                        //width: size.width,
                        height: (size.width)*.5,

                        child:CachedNetworkImage(
                          //color: Colors.green,
                          placeholder: (context, url) => Container(
                              height: 10,
                              width: 10,
                              child: Center(child: const CircularProgressIndicator())
                          ),
                          imageUrl: 'https://image.tmdb.org/t/p/w500${words[key[index]]['poster_path']}',
                          errorWidget: (context, url, error) => SizedBox(
                              width: size.width*.001,
                              height: size.height*.001,
                              child: Icon(Icons.error)),
                        ),


                      ),

                      Container(

                        //margin: EdgeInsets.only(top: 1),
                        color: selectedindex == index ?  Colors.blue : Colors.transparent,
                        width: 100,
                        height: 2,
                      ),




                      Container(

                        //width: 100,
                        child: Text(
                          words[key[index]]['title']!= null ?words[key[index]]['title']:
                          words[key[index]]['name']!= null ?words[key[index]]['name']:
                          'Loading...', style: TextStyle(fontSize: 15),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            );

          },


        ),
      ) : Center(
        child: Text('Nothing To Show'),
      )
      ,
    );

   }
}