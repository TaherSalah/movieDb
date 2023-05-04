import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../shared/componts/color.dart';
import '../shared/componts/ui_componts.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

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
          backgroundColor: ColorStyle.blackColor,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: const DefBottomNavBar(),
        );
      },
    );
  }
}
