import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  State<TvScreen> createState() => _TvScreenState();

}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    var tvList = BlocProvider.of<MovieCubit>(context).TvResults;

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: tvList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                    height: 200,
                    child: FadeInImage(
                        height: 200,
                        width: 450,
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(
                          'assets/images/loading-animation.gif',
                        ),
                        image: NetworkImage(
                          '$imageUrl${tvList[index].posterPath}',
                        ))),
              ),
              Text(
                tvList[index].title,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
