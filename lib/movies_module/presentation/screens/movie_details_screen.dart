import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants.dart';
import '../../domain/entities/movie.dart';
import '../components/movies_tile.dart';
import '../components/pop_and_toprated_component.dart';
import '../controller/movies_states.dart';
import 'movies_main_screen.dart';

class MovieDetails extends StatelessWidget {
  Movies? thisMovie;
  MovieDetails(this.thisMovie);

  @override
  Widget build(BuildContext context) {
    List<String> tmp = thisMovie!.releaseDate.split("-");
    String releaseYear = tmp[0];
    return BlocConsumer<MoviesCubit,MoviesStates>(
        listener: (context,state){},
      builder: (context,state){
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ));
          return Scaffold(
            backgroundColor: Color(0xff1E1E29),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin:Alignment.bottomCenter,
                        end: Alignment.topCenter,
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
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage("${Constants.imageUrl}"+thisMovie!.backdropPath),
                          fit: BoxFit.fitHeight,
                          height:  MediaQuery.of(context).size.height/2.5,
                          width:MediaQuery.of(context).size.width ,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios , size: 30,),
                              onPressed: (){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (BuildContext context) => MoviesMainScreen()));
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      thisMovie!.originalTitle,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration : BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              releaseYear,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.sp,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.star , color: Colors.yellow, size: 22,),
                        SizedBox(width: 5,),
                        Text(
                          thisMovie!.voteAverage.toString(),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                              color: Colors.white
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 8.0),
                    child: Text(
                      thisMovie!.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.sp,
                          color: Colors.white
                      ),

                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 8.0),
                    child: Text(
                     " More like this",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 8.0),
                     child: GridView.builder(
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 3,
                           childAspectRatio: 0.7,
                           crossAxisSpacing: 10,
                           mainAxisSpacing: 10
                         ),
                          itemCount: MoviesCubit.get(context).recommendations.length,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (BuildContext context) => MovieDetails(MoviesCubit.get(context).recommendations[index])));
                              },
                              child:Container(
                                  child: CachedNetworkImage(
                                      width: 100.0,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      imageUrl: "${Constants.imageUrl}"+MoviesCubit.get(context).recommendations[index].backdropPath,
                                    ),
                                ),
                            );
                          },
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,


                      ),
                   ),


                ],

              ),
            ),

          );
      },
    );

  }
}
