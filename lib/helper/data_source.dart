import 'base_network.dart';

class MovieDataSource{
  static MovieDataSource instance = MovieDataSource();
  Future<List<dynamic>> loadMovies(){
    return BaseNetwork.getList("movies");
  }
}