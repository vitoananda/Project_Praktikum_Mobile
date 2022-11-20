class MovieDetailModel {
  final List<Data>? data;
  final int? total;

  MovieDetailModel({
    this.data,
    this.total,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList(),
    'total' : total
  };
}

class Data {
  final int? id;
  final String? title;
  final String? releaseDate;
  final String? boxOffice;
  final int? duration;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final String? saga;
  final int? chronology;
  final int? postCreditScenes;
  final String? imdbId;

  Data({
    this.id,
    this.title,
    this.releaseDate,
    this.boxOffice,
    this.duration,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.chronology,
    this.postCreditScenes,
    this.imdbId,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        releaseDate = json['release_date'] as String?,
        boxOffice = json['box_office'] as String?,
        duration = json['duration'] as int?,
        overview = json['overview'] as String?,
        coverUrl = json['cover_url'] as String?,
        trailerUrl = json['trailer_url'] as String?,
        directedBy = json['directed_by'] as String?,
        phase = json['phase'] as int?,
        saga = json['saga'] as String?,
        chronology = json['chronology'] as int?,
        postCreditScenes = json['post_credit_scenes'] as int?,
        imdbId = json['imdb_id'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'release_date' : releaseDate,
    'box_office' : boxOffice,
    'duration' : duration,
    'overview' : overview,
    'cover_url' : coverUrl,
    'trailer_url' : trailerUrl,
    'directed_by' : directedBy,
    'phase' : phase,
    'saga' : saga,
    'chronology' : chronology,
    'post_credit_scenes' : postCreditScenes,
    'imdb_id' : imdbId
  };
}