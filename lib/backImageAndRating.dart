import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class backImageAndRating extends StatefulWidget{
  Size size;
  var movie;
  backImageAndRating({required this.size, required this.movie});

  @override
  State<backImageAndRating> createState() => _backImageAndRatingState();
}

class _backImageAndRatingState extends State<backImageAndRating> {
  @override
  Widget build(BuildContext context) {
    print('image build');
    return Container(
      width: widget.size.width,
      height: widget.size.height*.4,
      //height: 500,
      decoration: BoxDecoration(
        //color: Colors.black12
      ),

      child: Stack(
        children: [
          Container(
            width: widget.size.width,
            height: widget.size.height*.4 - 50,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30) , bottomRight: Radius.circular(30)),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage('https://image.tmdb.org/t/p/w500${movie['poster_path']}')
              ),
        child: Center(
          child: SingleChildScrollView(

            child:CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: Container(
                    height: 30,
                    width: 30,
                    child: Center(child: const CircularProgressIndicator())
                ),
              ),
              imageUrl: 'https://image.tmdb.org/t/p/w500${widget.movie['poster_path']}',
              errorWidget: (context, url, error) => InkWell(

                onTap: (){
                  Navigator.pop(context);
                  print('on tab');
                  setState(() {

                });},
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(Icons.error)),
              ),
            ),


          // child: Image(
          //   fit:BoxFit.fitWidth ,
          //
          //     image:NetworkImage('https://image.tmdb.org/t/p/w500${movie['poster_path']}'),
          // ),

              ),
        ),

            //child: Image.network('https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
              height: 100,
              width: widget.size.width*.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.only(bottomLeft: Radius.circular(30) , topLeft: Radius.circular(30))
              ),
                child: Center(child: Text('Rating...' , style: TextStyle(fontSize: 50),)),
          )
          ),
          Positioned(
            left: 10,
            top: 5,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios , color: Colors.blue,),
            ),
          ),




        ],
      ),

    );

  }
}