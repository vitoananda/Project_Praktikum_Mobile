import 'package:flutter/material.dart';
import 'Movies/MovieDetailModel.dart';
import 'WatchTrailer.dart';
class MovieDetail extends StatefulWidget {
  final Movies? movie;
  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context){
    String splice = "${widget.movie?.release_date}";
    String result = splice.substring(0,4);
      return Scaffold(
        appBar: AppBar(
          title: Text("${widget.movie?.title} (${result})",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                      Container(
                        width: 200, height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 6,
                              color: Colors.white12,
                        ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                              child: Image.network("${widget.movie?.cover_url}"))),
                      Padding(padding: const EdgeInsets.only(top:15.0)),
                      Text((widget.movie?.directed_by != null) ? "Directed By : ${widget.movie?.directed_by}" : "TBA",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),textAlign: TextAlign.center,),
                      Padding(padding: const EdgeInsets.only(top:8.0)),
                      Text(
                        (widget.movie?.overview != null) ? "${widget.movie?.overview}" : "TBA",
                        style: TextStyle(color: Colors.white), textAlign: TextAlign.justify,
                      ),
                      Padding(padding: const EdgeInsets.only(top:20.0)),
                      Builder(
                        builder: (context) => ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => WatchTrailer()));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Watch Trailer'),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward_ios)
                                ]
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white12,
                              padding: EdgeInsets.all(10.0),
                              fixedSize: Size(250,50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // <-- Radius
                              ),
                              side: BorderSide(color: Colors.white12, width: 2),
                              textStyle : TextStyle(fontSize: 23),
                              elevation: 15,
                            )

                        ),
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
