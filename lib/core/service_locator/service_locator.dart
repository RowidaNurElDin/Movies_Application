import 'package:clean_arch/movies_module/data/data_source/remote_data_source.dart';
import 'package:clean_arch/movies_module/data/repository/movie_repository.dart';
import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:clean_arch/movies_module/domain/use_cases/get_now_playing_use_case.dart';
import 'package:clean_arch/movies_module/domain/use_cases/get_recommendations_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../movies_module/domain/use_cases/get_popular_use_case.dart';
import '../../movies_module/domain/use_cases/get_top_rated_use_case.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator{
  void init(){

    //Use cases
    serviceLocator.registerLazySingleton(() => GetNowPlayingUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetPopularUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetTopRatedUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetRecommendationsUseCase(serviceLocator()));
    //Repo
    serviceLocator.registerLazySingleton<BaseRepository>(() => MoviesRepository(serviceLocator()));
    //Data Source
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

  }



}