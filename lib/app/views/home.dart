import 'package:carousel_slider/carousel_slider.dart';

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
      // body: GridView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   itemCount:4,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //   ),
      //   itemBuilder: (context, index) {

      body: CarouselSlider.builder(
        itemCount: movieController.movieList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Column(
          children: [
            movieController.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Image.network(
                    '$originalImage${movieController.movieList[itemIndex].backdropPath}')
          ],
        ),
        options: CarouselOptions(
          autoPlay: true,
          scrollPhysics: BouncingScrollPhysics(),
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
