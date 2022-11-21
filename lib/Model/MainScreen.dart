
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_praktikum/helper/base_network.dart';
import 'package:projek_praktikum/Model/Movies/MovieDetailModel.dart';
import 'MovieDetail.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home : Scaffold(
          appBar: AppBar(
            title: Text("Marvel Cinematic Universe"),
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
            color: Colors.black87,
            padding:  EdgeInsets.all(8),
            child: FutureBuilder(
              future: BaseNetwork.get("movies"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                if(snapshot.hasError){
                  return _buildErrorSection();
                }
                if(snapshot.hasData){
                  MoviesModel moviesModel = MoviesModel.fromJson(snapshot.data);
                  return _buildSuccessSection(moviesModel);
                }
                return _buildLoadingSection();
              },
            ),
          ),
        )
    );
  }
  Widget _buildErrorSection(){
    return Text("Error");
  }
  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MoviesModel data){

    return ListView.builder(
        itemCount: data.movies?.length,
        itemBuilder: (BuildContext context, int index){


          final Movies? movies = data.movies?[index];
          String splice = "${data.movies?[index].release_date}";
          String result = splice.substring(0,4);
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(movie: movies)));
            },
            child : Card(
              color: Colors.black26,
              child: ListTile(
                title: Text((data.movies?[index].release_date != null) ?
                "${data.movies?[index].title} (${result})"
                  : "${data.movies?[index].title}",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                subtitle: Text((data.movies?[index].duration != 0) ?
                "Duration : ${data.movies?[index].duration} Minutes"
                    : "Duration : TBA",
                    style: TextStyle(color: Colors.white)),
                leading: Image.network("${data.movies?[index].cover_url}") ,

              ),
            ),
          );
        }
    );
  }
}





