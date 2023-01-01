import 'package:clean_arch/movies_module/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_exceptions/api_exceptions.dart';

abstract class BaseRepository{
  Future<Either<ServerException, List<Movies>>> getNowPlaying();

  Future<Either<ServerException, List<Movies>>> getPopular();

  Future<Either<ServerException, List<Movies>>> getTopRated();

  Future<Either<ServerException, List<Movies>>> getMovieRecommendations(String movieID);

}