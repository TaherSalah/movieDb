import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:provider/provider.dart';

import '../shard/exports/app_exports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final movieController = Provider.of<MovieDbProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(movieController.isLoading ? 'movieLoading' : 'Movie Db App'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Text('${movieController.movieList[index].title}');
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: movieController.movieList.length),
    );
  }
}
