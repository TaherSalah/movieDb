import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BlocProvider.of<MovieCubit>(context).trendingResults;
        if (state is GetTrendingSuccessState) {
          return Scaffold(
            body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Image.network('$imageUrl${list[index].posterPath}');
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
