import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/core/service_locator/service_locator.dart';
import 'package:clean_arch/movies_module/presentation/components/pop_and_toprated_component.dart';
import 'package:clean_arch/movies_module/presentation/components/title_component.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_cubit.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_states.dart';
import 'package:clean_arch/movies_module/presentation/screens/popular_movies_screen.dart';
import 'package:clean_arch/movies_module/presentation/screens/top_rated_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants.dart';

class MoviesMainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit,MoviesStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Constants.usedColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if(state is MoviesLoadingState)
                      Center(child: CircularProgressIndicator(color: Colors.blueGrey,),),
                    CarouselSlider(
                      options: CarouselOptions(height:  MediaQuery.of(context).size.height/2),
                      items: MoviesCubit.get(context).nowPlayingMoviesList.map((i) {
                        return GestureDetector(
                          child: Stack(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (rect) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            // fromLTRB
                                            Colors.transparent,
                                            Colors.black,
                                            Colors.black,
                                            Colors.transparent,
                                          ],
                                          stops: [0, 0.3, 0.5, 1],
                                        ).createShader(
                                          Rect.fromLTRB(0, 0, rect.width, rect.height),
                                        );
                                      },
                                      blendMode: BlendMode.dstIn,
                                      child: Image(
                                          image: NetworkImage("${Constants.imageUrl}"+i.backdropPath),
                                          fit: BoxFit.fitHeight,
                                        height:  MediaQuery.of(context).size.height/2,
                                        width:MediaQuery.of(context).size.width ,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 4.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:  [
                                               const CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.red,
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  "NOW PLAYING",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp,
                                                      color: Colors.white


                                                  ),

                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              i.originalTitle,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize:15.sp,
                                                color: Colors.white
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                        );
                      }).toList(),
                    ),
                    titleComponent(context, "Popular"),
                    MainScreenMovieComponent(context, MoviesCubit.get(context).popularMoviesList),
                    titleComponent(context, "Top Rated"),
                    MainScreenMovieComponent(context, MoviesCubit.get(context).topRatedMoviesList),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
