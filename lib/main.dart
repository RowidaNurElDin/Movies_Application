import 'package:clean_arch/core/service_locator/service_locator.dart';
import 'package:clean_arch/movies_module/presentation/screens/movies_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_module/presentation/controller/movies_cubit.dart';


void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => MoviesCubit(serviceLocator(),serviceLocator(),serviceLocator(),serviceLocator())..getNowPlaying()..getPopular()..getTopRated()),

        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MoviesMainScreen(),
            );
          },
        ));
  }
}
