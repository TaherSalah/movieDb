import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/componts/color.dart';
import 'package:movie_db/shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/widget/popular.dart';
import '../../shared/widget/top_rated.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    BlocProvider.of<MovieCubit>(context).fetchPopular();
    BlocProvider.of<MovieCubit>(context).fetchTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BlocProvider.of<MovieCubit>(context).topRatedResults;
        var listp = BlocProvider.of<MovieCubit>(context).popularResults;

        if (state is GetTopRatedSuccessState ||
            state is GetPopularSuccessState) {
          return Scaffold(
              backgroundColor: ColorStyle.primColor,
              body: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: TopRatedMovie()),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: PopularMovie()),
                ],
              ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
