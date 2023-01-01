import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/movies_module/data/models/movie_model.dart';
import 'package:clean_arch/movies_module/presentation/screens/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_cubit.dart';

Widget moviesTile(context, Movies movie){
  List<String> tmp = movie.releaseDate.split("-");
  String releaseYear = tmp[0];
  return GestureDetector(
    onTap: (){
      MoviesCubit.get(context).getMovieRecommendations(movie.id.toString());
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MovieDetails(movie)
          )
      );
    },
    child: Container(
      height: 140.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constants.usedColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5.0 , right: 10 , top: 5 , bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: CachedNetworkImage(
                  width: 100.0.w,
                  height: 140.h,
                  fit: BoxFit.cover,
                  imageUrl: "${Constants.imageUrl}"+movie.backdropPath,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0 , right: 10 , top: 15, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.originalTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0 , right: 8.0 , bottom: 8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration : BoxDecoration(
                              color: Colors.red,
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
                            movie.voteAverage.toString(),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                color: Colors.white
                            ),
                          )

                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        movie.overview,
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12.sp,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )



          ],
        ),
      ),

    ),
  );

}