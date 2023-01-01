import 'package:clean_arch/movies_module/domain/entities/movie.dart';

class MovieModel extends Movies{
  const MovieModel(
      {required super.backdropPath,
        required super.id,
        required super.originalTitle,
        required super.overview,
        required super.releaseDate,
        required super.voteAverage}
      );

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        backdropPath : json['backdrop_path'],
        id: json['id'],
        originalTitle : json['original_title'],
        overview : json['overview'],
        releaseDate : json['release_date'],
        voteAverage : json['vote_average']
    );

  }
}
