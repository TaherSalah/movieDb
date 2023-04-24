import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';

class TrendingScreen extends StatefulWidget {
  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    var trendingList = BlocProvider.of<MovieCubit>(context).trendingResults;

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: trendingList.length,
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
                          '$imageUrl${trendingList[index].posterPath}',
                        ))),
              ),
              Text(
                trendingList[index].title,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
