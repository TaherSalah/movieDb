import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

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
          appBar: AppBar(
            title: Text('pepole'),
          ),

        );

      },
    );
  }
}
