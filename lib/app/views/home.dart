import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:movie_db_app/app/shard/constanc/url.dart';
import 'package:provider/provider.dart';
import '../shard/exports/app_exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieController = Provider.of<MovieDbProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title:
              Text(movieController.isLoading ? 'movieLoading' : 'Movie Db App'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Movie Trending',
                  style: GoogleFonts.cairo(
                      color: Colors.amber,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final movieList = movieController.movieList[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          '$originalImage${movieList.posterPath}',
                          height: 180.h,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'TV Trending',
                  style: GoogleFonts.cairo(
                      color: Colors.amber,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final tvList = movieController.tvList[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          '$originalImage${tvList.posterPath}',
                          height: 180.h,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 200,
                child: Expanded(
                  child: ListView.separated(

                    scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      // shrinkWrap: true,

                      itemBuilder: (context, index) {
                        final nowPlayingList =
                            movieController.nowPlayingList[index];
                        return Card(
                          child: Column(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                child: Image.network(
                                  '$originalImage${nowPlayingList.posterPath}',
                                  height: 180.h,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: movieController.nowPlayingList.length),
                ),
              )
            ],
          ),
        ));
  }
}
