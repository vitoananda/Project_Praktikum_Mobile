import 'package:flutter/material.dart';
import 'movie_detail.dart';
import 'Movies/MovieDetailModel.dart';

class MovieDetail extends StatefulWidget {
  final Movies? movie;
  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("${widget.movie?.title}",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children : [
                Container(
                child :
                  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200, height: 300,
                          child: Image.network("${widget.movie?.cover_url}")),
                      Padding(padding: const EdgeInsets.only(top:8.0)),

                      Text("Directed by : ${widget.movie?.directed_by}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),textAlign: TextAlign.center,),
                      Padding(padding: const EdgeInsets.only(top:8.0)),
                      Text(
                        (widget.movie?.overview != null) ? "${widget.movie?.overview}" : "TBA",
                        style: TextStyle(color: Colors.white), textAlign: TextAlign.justify,
                      ),

                    ],
                  ),
                ),

              ),
            ]
            ),
          ),
        ),
      );
  }
}
