// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_const_constructors, missing_return, avoid_unnecessary_containers, avoid_print
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:projek_praktikum/helper/data_source.dart';
// import 'Movies/MovieDetailModel.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home : Scaffold(
//         appBar: AppBar(
//           title: Text("Marvel Movies"),
//         ),
//         body: Container(
//           padding:  EdgeInsets.all(8),
//           child: FutureBuilder(
//             future: MovieDataSource.instance.loadMovies(),
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
//               if(snapshot.hasError){
//                 return _buildErrorSection();
//               }
//               if(snapshot.hasData){
//                 return _buildSuccessSection(snapshot.data);
//               }
//               return _buildLoadingSection();
//             },
//           ),
//         ),
//       )
//     );
//   }
//   Widget _buildErrorSection(){
//     return Text("Error");
//   }
//   Widget _buildLoadingSection(){
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   Widget _buildSuccessSection(MovieDetailModel data){
//     return ListView.builder(
//       itemCount: data.data?.length,
//         itemBuilder: (BuildContext context, int index){
//           return _buildMovieList("${data.Data?[index].title}");
//         }
//     );
//   }
//   Widget _buildMovieList(MovieDetailModel Data){
//     return InkWell(
//       onTap: (){},
//           child: Card(
//             child: Row(
//               children: [
//                 Container(
//                   width: 100,
//                   height: 200,
//                   child: Text("test"),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text("s")
//               ],
//             ),
//
//     ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_praktikum/helper/base_network.dart';
import 'package:projek_praktikum/Model/Movies/MovieDetailModel.dart';
import 'MovieDetail.dart';


class MoviesDataSource{
  static MoviesDataSource instance = MoviesDataSource();
  Future<Map<String, dynamic>> loadMovies(){
    return BaseNetwork.get("movies");
  }
}



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
          appBar: AppBar(
            title: Text("Marvel Cinematic Universe Movies"),
          ),
          body: Container(
            padding:  EdgeInsets.all(8),
            child: FutureBuilder(
              future: MoviesDataSource.instance.loadMovies(),
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
          return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail()));
              },
              child : Card(
                  child: ListTile(
                      title: Text("${data.movies?[index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text("Duration : ${data.movies?[index].duration} Minutes"),

              ),
              ),
              );
            }
          );
        }
  }

// Widget _buildMovieList(Movies Data){
//   return InkWell(
//     onTap: (){},
//     child: Card(
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 200,
//             child: Text("test"),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Text("s")
//         ],
//       ),
//
//     ),
//   );
// }



