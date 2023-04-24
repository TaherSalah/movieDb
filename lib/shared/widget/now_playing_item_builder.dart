import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/constance.dart';
import '../cubit/cubit.dart';

class NowPlayingBuilder extends StatefulWidget {
  const NowPlayingBuilder({Key? key}) : super(key: key);

  @override
  State<NowPlayingBuilder> createState() => _NowPlayingBuilderState();
}

class _NowPlayingBuilderState extends State<NowPlayingBuilder> {
  @override
  Widget build(BuildContext context) {
    var nowPlayingList =
        BlocProvider.of<MovieCubit>(context).nowPlayingResults;
    return ListView.separated(

      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: nowPlayingList.length,
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
                          '$imageUrl${nowPlayingList[index].posterPath}',
                        )))
              ],
            ),
          ],
        );
      },
    );
  }
}
