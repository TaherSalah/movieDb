import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../componts/constance.dart';
import '../cubit/cubit.dart';

class TvAiringBuilder extends StatefulWidget {
  const TvAiringBuilder({Key? key}) : super(key: key);

  @override
  State<TvAiringBuilder> createState() => _TvAiringBuilderState();
}

class _TvAiringBuilderState extends State<TvAiringBuilder> {
  @override
  Widget build(BuildContext context) {
    var airingList = BlocProvider.of<MovieCubit>(context).airingTvResults;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: airingList.length,
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
                          '$imageUrl${airingList[index].posterPath}',
                        )))
              ],
            ),
          ],
        );
      },
    );
  }
}
