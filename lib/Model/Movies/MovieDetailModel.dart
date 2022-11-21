class MoviesModel {
  List<Movies>? movies;

  MoviesModel({
    this.movies,
  });

  MoviesModel.fromJson(Map<String, dynamic> json){
    if (json['data'] != null) {
      movies = <Movies>[];
      json['data'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  int? id;
  String? title;
  String? release;
  int? duration;

  Movies({
    this.id,
    this.title,
    this.release,
    this.duration,
  });

  Movies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    release = json['release_date'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['release'] = this.release;
    data['duration'] = this.duration;
    return data;
  }
}