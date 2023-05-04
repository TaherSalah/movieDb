import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/shared/cubit/cubit.dart';
import 'package:movie/shared/network/remote/dio_helper.dart';


import 'layout/layout_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()
        ..fetchPopular()
        ..fetchTopRated()
        ..fetchNowPlaying()
        ..fetchUpcoming()
        ..fetchTrendingData()
        ..fetchTv()..fetchPerson(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const LayoutScreen(),
      ),
    );
  }
}
