import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/componts/color.dart';
import 'package:movie_db/shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/widget/main_title.dart';
import '../../shared/widget/now_playing_item_builder.dart';
import '../../shared/widget/popular.dart';
import '../../shared/widget/popular_item_builder.dart';
import '../../shared/widget/search_bar.dart';
import '../../shared/widget/top_rated.dart';
import '../../shared/widget/top_trending_item_builder.dart';
import '../../shared/widget/tv_airing_item_builder.dart';
import '../../shared/widget/up_coming_item_builder.dart';

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
    // BlocProvider.of<MovieCubit>(context).fetchAiringTv();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var topRatedList = BlocProvider
            .of<MovieCubit>(context)
            .topRatedResults;
        var popularList = BlocProvider
            .of<MovieCubit>(context)
            .popularResults;

        var upList = BlocProvider
            .of<MovieCubit>(context)
            .upcomingResults;
        var airingList = BlocProvider
            .of<MovieCubit>(context)
            .airingTvResults;

        if (state is GetTopRatedSuccessState ||
            state is GetTvAiringTodayLoadingState ||
            state is GetPopularSuccessState ||
            state is GetUpComingSuccessState) {
          return Scaffold(
              backgroundColor: ColorStyle.primColor,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                    const SizedBox(
                      height: 200,
                      child: TopTrendingBuilder(),
                    ),
                    mainTitle(startTitle: 'Popular'),
                    const SizedBox(
                      height: 200,
                      child: PopularBuilder(),
                    ),
                    mainTitle(startTitle: 'TV Airing'),
                    const SizedBox(
                      height: 200,
                      child: TvAiringBuilder(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitle(startTitle: 'Now Playing'),
                    const SizedBox(
                      height: 200,
                      child: NowPlayingBuilder(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitle(startTitle: 'Up Coming'),
                    const SizedBox(
                      height: 200,
                      child: UpComingBuilder(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    mainTitle(startTitle: 'Top Rated'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: topRatedList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 200,
                              child: FadeInImage(
                                  height: 200,
                                  width: 450,
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                    'assets/images/loading-animation.gif',
                                  ),
                                  image: NetworkImage(
                                    '$imageUrl${topRatedList[index].posterPath}',
                                  )));
                        },
                      ),
                    )
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
