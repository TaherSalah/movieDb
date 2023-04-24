import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/constance.dart';
import '../cubit/cubit.dart';

class PopularBuilder extends StatefulWidget {
  const PopularBuilder({Key? key}) : super(key: key);

  @override
  State<PopularBuilder> createState() => _PopularBuilderState();
}

class _PopularBuilderState extends State<PopularBuilder> {
  @override
  Widget build(BuildContext context) {
    var popularList = BlocProvider.of<MovieCubit>(context).popularResults;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: popularList.length,
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
                          '$imageUrl${popularList[index].posterPath}',
                        )))
              ],
            ),
          ],
        );
      },
    );
  }
}
