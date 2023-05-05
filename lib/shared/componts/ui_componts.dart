import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';


class DefBottomNavBar extends StatefulWidget {
  const DefBottomNavBar({Key? key}) : super(key: key);

  @override
  State<DefBottomNavBar> createState() => _DefBottomNavBarState();
}

class _DefBottomNavBarState extends State<DefBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      elevation: 20,
      fixedColor: Colors.green,
      unselectedIconTheme: const IconThemeData(color: Colors.orange),
      currentIndex: BlocProvider.of<MovieCubit>(context).currentIndex,
      onTap: (index) {
        BlocProvider.of<MovieCubit>(context).changeBottomNavBar(index);
        setState(() {});
      },
      iconSize: 30,
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'All'),
        BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_rounded), label: 'Trending'),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
      ],
    );
  }
}
