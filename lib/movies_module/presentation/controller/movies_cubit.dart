import 'package:clean_arch/movies_module/domain/use_cases/get_now_playing_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/use_cases/get_popular_use_case.dart';
import '../../domain/use_cases/get_recommendations_use_case.dart';
import '../../domain/use_cases/get_top_rated_use_case.dart';
import 'movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  GetPopularUseCase getPopularUseCase;
  GetTopRatedUseCase getTopRatedUseCase;
  GetRecommendationsUseCase getRecommendationsUseCase;

  MoviesCubit(this.getNowPlayingUseCase , this.getPopularUseCase ,this.getTopRatedUseCase , this.getRecommendationsUseCase) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);
  List<Movies> nowPlayingMoviesList = [];
  List<Movies> popularMoviesList = [];
  List<Movies> topRatedMoviesList = [];
  List<Movies> recommendations = [];



  void getNowPlaying() async {
    emit(MoviesLoadingState());


    final result = await getNowPlayingUseCase.executeNowPlaying();

    result.fold(
            (l) => emit(GetNowPlayingErrorState()),
            (r){
              //print(r);
              nowPlayingMoviesList =r;
              print(nowPlayingMoviesList);
              emit(GetNowPlayingSuccessState());
            });



  }
  void getPopular() async {
    emit(MoviesLoadingState());

    final result = await getPopularUseCase.executeGetPopular();

    result.fold(
            (l) => emit(GetPopularErrorState()),
            (r){
          print(r);
          popularMoviesList =r;
          emit(GetPopularSuccessState());
        });
  }
  void getTopRated() async {
    emit(MoviesLoadingState());

    final result = await getTopRatedUseCase.executeGetTopRated();

    result.fold(
            (l) => emit(GetTopRatedErrorState()),
            (r){
          print(r);
          topRatedMoviesList =r;
          emit(GetTopRatedSuccessState());
        });



  }
  void getMovieRecommendations(String movieID) async {
    emit(MoviesLoadingState());

    final result = await getRecommendationsUseCase.executeGetRecommentations(movieID);

    result.fold(
            (l) => emit(GetTopRatedErrorState()),
            (r){
              print("RECOMMENDATIONS");
          print(r);
          recommendations =r;
          emit(GetTopRatedSuccessState());
        });



  }

}
