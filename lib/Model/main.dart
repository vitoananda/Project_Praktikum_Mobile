// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_const_constructors, missing_return, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_praktikum/helper/data_source.dart';
import 'Movies/MovieDetailModel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("Marvel Movies"),
        ),
        body: Container(
          padding:  EdgeInsets.all(8),
          child: FutureBuilder(
            future: MovieDataSource.instance.loadMovies(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasError){
                return _buildErrorSection();
              }
              if(snapshot.hasData){
                return _buildSuccessSection(snapshot.data);
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

  Widget _buildSuccessSection(List<dynamic> data){
    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
        return _buildMovieList(data[index]);
        }
    );
  }
  Widget _buildMovieList(MovieDetailModel Data){
    return InkWell(
      onTap: (){},
          child: Card(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 200,
                  child: Text("test"),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("s")
              ],
            ),

    ),
    );
  }
}


