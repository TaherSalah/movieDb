import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/componts/color.dart';
import 'package:movie_db/shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/widget/main_title.dart';
import '../../shared/widget/popular.dart';
import '../../shared/widget/search_bar.dart';
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
        var topRatedList = BlocProvider.of<MovieCubit>(context).topRatedResults;
        var popularList = BlocProvider.of<MovieCubit>(context).popularResults;

        if (state is GetTopRatedSuccessState) {
          return Scaffold(
              backgroundColor: ColorStyle.primColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    searchBarWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    mainTitle(startTitle: 'Top Trending'),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: topRatedList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                  height: 200,
                                  child: FadeInImage(
                                      height: 200,
                                      fit: BoxFit.cover,
                                      placeholder: AssetImage(
                                        'assets/images/loading-animation.gif',
                                      ),
                                      image: NetworkImage(
                                        '$imageUrl${topRatedList[index].posterPath}',
                                      )))
                            ],
                          );
                        },
                      ),
                    ),
                    mainTitle(startTitle: 'Popular'),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: popularList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                  height: 200,
                                  child: FadeInImage(
                                      height: 200,
                                      fit: BoxFit.cover,
                                      placeholder: AssetImage(
                                        'assets/images/loading-animation.gif',
                                      ),
                                      image: NetworkImage(
                                        '$imageUrl${popularList[index].posterPath}',
                                      )))
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: double.maxFinite,
                      child: Expanded(
                        child: GridView.builder(
                          itemCount: popularList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                              childAspectRatio: 2/3,
                              crossAxisSpacing: 2),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '$imageUrl${popularList[index].posterPath}'))),
                              height: 100,
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
