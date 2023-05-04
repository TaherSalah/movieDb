import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/constance.dart';
import '../cubit/cubit.dart';

class UpComingBuilder extends StatefulWidget {
  const UpComingBuilder({Key? key}) : super(key: key);

  @override
  State<UpComingBuilder> createState() => _UpComingBuilderState();
}

class _UpComingBuilderState extends State<UpComingBuilder> {
  @override
  Widget build(BuildContext context) {
    var upComingList =
        BlocProvider.of<MovieCubit>(context).upcomingResults;
    return ListView.separated(

      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemCount: upComingList.length,
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
                          '$imageUrl${upComingList[index].posterPath}',
                        )))
              ],
            ),
          ],
        );
      },
    );
  }
}
