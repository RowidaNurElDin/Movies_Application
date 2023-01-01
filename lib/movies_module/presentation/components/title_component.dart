import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/popular_movies_screen.dart';
import '../screens/top_rated_movies_screen.dart';

Widget titleComponent(context , String title)=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
      InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) =>
                  title == "Popular" ? PopularMoviesScreen() : TopRatedMoviesScreen()));
        },
        child: Row(
          children: [
            Text("See more",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  color: Colors.white

              ),
            ),
            Icon(Icons.arrow_forward_ios , color: Colors.white,size: 15,)
          ],
        ),
      )

    ],
  ),
);