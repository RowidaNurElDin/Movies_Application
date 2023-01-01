import 'package:clean_arch/core/api_exceptions/api_exceptions.dart';
import 'package:clean_arch/core/errors_model/errors_model.dart';
import 'package:clean_arch/core/utils/constants.dart';
import 'package:clean_arch/movies_module/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../models/movie_model.dart';

abstract class BaseRemoteDataSource{
  Future<List<Movies>> getNowPlaying();

  Future<List<Movies>> getPopular();

  Future<List<Movies>> getTopRated();

  Future<List<Movies>> getMovieRecommendations(String movieID);

}


class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<List<Movies>> getNowPlaying()async{

    print(Constants.nowPlayingMoviesEndPoint);
    final response = await Dio().get(Constants.nowPlayingMoviesEndPoint);
    if(response.statusCode == 200){
      return List<Movies>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorsModel.fromJson(response.data));

    }

  }

  @override
  Future<List<Movies>> getPopular()async{

    final response = await Dio().get(Constants.popularMoviesEndPoint);
    if(response.statusCode == 200){
      return List<Movies>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorsModel.fromJson(response.data));

    }

  }

  @override
  Future<List<Movies>> getTopRated()async{

    final response = await Dio().get(Constants.topRatedMoviesEndPoint);
    if(response.statusCode == 200){
      return List<Movies>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorsModel.fromJson(response.data));

    }

  }


  @override
  Future<List<Movies>> getMovieRecommendations(String movieID)async{

    final response = await Dio().get("${Constants.baseUrl}movie/${movieID}/recommendations?api_key=$Constants.apiKey");
    if(response.statusCode == 200){
      return List<Movies>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorsModel.fromJson(response.data));

    }

  }
}
