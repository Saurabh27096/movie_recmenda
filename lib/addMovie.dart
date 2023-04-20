import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_top/provider1.dart';

import 'package:provider/provider.dart';





class addMovie extends StatelessWidget{
  var movie;
  addMovie({required this.movie});

  @override
  Widget build(BuildContext context) {

    final watchlist = Provider.of<watchListProvider>(context);

    return Row(
      
      children: [
          Expanded(
            child: Padding(
              //padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie['title'] != null ? movie['title']: movie['name'] != null ? movie['name'] : 'Movie Name Loading...'

                    , style: TextStyle(fontSize: 25),),
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 50,
                      // ),
                      Text('2019'),
                      SizedBox(
                        width: 50,
                      ),
                      Text('2h 22min')
                    ],
                  )
                ],
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ElevatedButton(

              onPressed: (){
                print(watchlist.words.keys);

                // print(watchlist.words.length);
                // if (watchlist.words.length >= 2){
                //   print(watchlist.words[0] == watchlist.words[1]);
                // }
                //
                // print('list are ${watchlist.words}');

                watchlist.toggleList(movie);

          }, //child: Icon(Icons.add , size: 36,),

              child: !watchlist.contains(movie)  ? Icon(Icons.add , size: 36,) : Icon(Icons.bookmark_added , size: 36,)

          ),
        )

      ],
    );
  }

}