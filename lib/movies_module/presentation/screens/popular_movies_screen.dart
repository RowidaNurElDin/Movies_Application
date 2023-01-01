import 'package:clean_arch/core/service_locator/service_locator.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_states.dart';
import 'package:clean_arch/movies_module/presentation/screens/movies_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/movies_tile.dart';
import 'package:clean_arch/movies_module/presentation/controller/movies_cubit.dart';


class PopularMoviesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MoviesCubit, MoviesStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E29),
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Popular Movies",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17.sp,
              color: Colors.white
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios , size: 20,),
          onPressed: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => MoviesMainScreen()));
          },
        ),
        backgroundColor: Color(0xff1E1E29),
        elevation: 0,
      ),
      body: ClipRRect(
        child: ListView.builder(
            itemBuilder: (context,index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: moviesTile(context , MoviesCubit.get(context).popularMoviesList[index] ),
            ),
          itemCount: MoviesCubit.get(context).popularMoviesList.length,
          physics: BouncingScrollPhysics(),

        ),
      ),
    );
  },
);
  }
}
