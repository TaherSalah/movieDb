import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/cubit/cubit.dart';
import 'package:movie_db/shared/cubit/states.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener:(context, state) {

      },
      builder:(context, state) {
        return const Scaffold(
          body: Text('movies Screen'),
        );
      },

    );
  }
}
