import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:movie_db_app/app/views/home.dart';
import 'package:provider/provider.dart';

void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return  ChangeNotifierProvider(
          create: (context) => MovieDbProvider()..getMovieData(),
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Home(),
          ),
        );
      },

    );
  }
}
