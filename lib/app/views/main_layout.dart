import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:movie_db_app/app/shard/constanc/url.dart';
import 'package:provider/provider.dart';

import '../shard/exports/app_exports.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MovieDbProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.isLoading?'loading...':'Movies DB'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text('Movie Treinding',style: TextStyle(fontSize: 25),),
            ),
            MasonryGridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          '$originalImage${controller.movieList[index].backdropPath}'),
                    ),
                  ],
                );
              },
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
             Text('Playing Now',style: TextStyle(fontSize: 25),),

            MasonryGridView.builder(

              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: controller.tvList.length,
              itemBuilder: (context, index) {
                final playing=controller.tvList[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(

                          '$originalImage${playing.backdropPath}'),
                    ),
                  ],
                );
              },
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),

          ],
        ),
      )
    );
  }
}
