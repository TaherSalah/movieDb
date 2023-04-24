import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/constance.dart';
import '../cubit/cubit.dart';

class TopTrendingBuilder extends StatefulWidget {
  const TopTrendingBuilder({Key? key}) : super(key: key);

  @override
  State<TopTrendingBuilder> createState() => _TopTrendingBuilderState();
}

class _TopTrendingBuilderState extends State<TopTrendingBuilder> {
  @override
  Widget build(BuildContext context) {
    var trendingList = BlocProvider.of<MovieCubit>(context).trendingResults;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: trendingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                    height: 200,
                    child: FadeInImage(
                        height: 200,
                        width: 450,
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(
                          'assets/images/loading-animation.gif',
                        ),
                        image: NetworkImage(
                          '$imageUrl${trendingList[index].posterPath}',
                        )))
              ],
            ),
          ],
        );
      },
    );
  }
}
