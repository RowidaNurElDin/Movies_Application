import 'package:clean_arch/core/api_exceptions/api_exceptions.dart';
import 'package:clean_arch/movies_module/domain/entities/movie.dart';
import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source.dart';

class MoviesRepository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<ServerException, List<Movies>>> getNowPlaying() async {
    final result = await baseRemoteDataSource.getNowPlaying();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorsModel));
    }

  }

  @override
  Future<Either<ServerException, List<Movies>>> getPopular() async {
    final result = await baseRemoteDataSource.getPopular();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorsModel));
    }
  }

  @override
  Future<Either<ServerException, List<Movies>>> getTopRated() async{
    final result = await baseRemoteDataSource.getTopRated();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorsModel));
    }
  }

  @override
  Future<Either<ServerException, List<Movies>>> getMovieRecommendations(String movieID) async {
    final result = await baseRemoteDataSource.getTopRated();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerException(error.errorsModel));
    }

  }

}