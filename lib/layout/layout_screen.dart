import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/cubit/cubit.dart';
import 'package:movie_db/shared/cubit/states.dart';

import '../shared/componts/ui_componts.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<MovieCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movie DB'),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: const DefBottomNavBar(),
        );
      },
    );
  }
}
