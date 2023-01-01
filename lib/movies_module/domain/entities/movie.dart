import 'package:equatable/equatable.dart';

class Movies extends Equatable{
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final dynamic voteAverage;


  const Movies(
      {required this.backdropPath,
        required this.id,
        required this.originalTitle,
        required this.overview,
        required this.releaseDate,
        required this.voteAverage
      });

  @override
  List<Object?> get props => [backdropPath,id,originalTitle,overview,releaseDate,voteAverage];






}