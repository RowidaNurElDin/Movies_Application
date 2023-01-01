import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../domain/entities/movie.dart';
import '../screens/movie_details_screen.dart';

Widget MainScreenMovieComponent(context , List<Movies> list )=>Container(
  height: MediaQuery.of(context).size.height/5 ,
  child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length ,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            MoviesCubit.get(context).getMovieRecommendations(list[index].id.toString());
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => MovieDetails(list[index])));

          },
          child: Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 120.0,
                fit: BoxFit.cover,
                imageUrl: "${Constants.imageUrl}"+list[index].backdropPath,
              ),
            ),
          ),
        );}
  ),);