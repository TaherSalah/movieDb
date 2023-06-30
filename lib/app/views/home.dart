import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:movie_db_app/app/shard/constanc/url.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

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
        body: Column(
          children: [
            movieController.isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: SizedBox(
                      // height: 300.h,
                      child: ScrollSnapList(

                        scrollDirection: Axis.horizontal,
                        itemBuilder: (p0, p1) {
                          return _buildListItem(context, p1);
                        },

                        // ignore: prefer_if_null_operators, unnecessary_null_comparison
                        itemCount: movieController.movieList.length == null
                            ? 0
                            : movieController.movieList.length,
                        itemSize: 150,
                        scrollPhysics: const BouncingScrollPhysics(),
                        onItemFocus: (p0) {},
                      ),
                    ),
                  ),
          ],
        ));
  }
}

Widget _buildListItem(BuildContext context, int index) {
  final controller = Provider.of<MovieDbProvider>(context).movieList;
  final prov = Provider.of<MovieDbProvider>(context);
  return Column(
    children: [
      SizedBox(
          height: 200,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                '$originalImage${controller[index].backdropPath}',
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ))
    ],
  );
}
