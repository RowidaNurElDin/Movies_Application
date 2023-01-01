import 'dart:ui';

class Constants{
  static Color usedColor = Color(0xff303030);

  static String baseUrl = "https://api.themoviedb.org/3/";

  static String apiKey = "84e5bc8fed0515033701dc3dfe563e92";

  static String nowPlayingMoviesEndPoint = "${baseUrl}movie/now_playing?api_key=$apiKey";

  static String popularMoviesEndPoint = "${baseUrl}movie/popular?api_key=$apiKey";

  static String topRatedMoviesEndPoint = "${baseUrl}movie/top_rated?api_key=$apiKey";

  static String imageUrl = "https://image.tmdb.org/t/p/w500";


}

