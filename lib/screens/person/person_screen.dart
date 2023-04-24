import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/cubit/states.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';

class PepoleScreen extends StatelessWidget {
  const PepoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var personList = BlocProvider.of<MovieCubit>(context).personResults;

    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(),
          body: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            itemCount: personList.length,
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
                              '$imageUrl${personList[index].posterPath}',
                            ))),
                  ),
                  Text(
                    personList[index].title,
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
