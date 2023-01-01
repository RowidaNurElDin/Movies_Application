
abstract class MoviesStates {}

class MoviesInitial extends MoviesStates {}

class MoviesLoadingState extends MoviesStates{}

class GetNowPlayingErrorState extends MoviesStates{}

class GetNowPlayingSuccessState extends MoviesStates{}

class GetPopularErrorState extends MoviesStates{}

class GetPopularSuccessState extends MoviesStates{}

class GetTopRatedErrorState extends MoviesStates{}

class GetTopRatedSuccessState extends MoviesStates{}


