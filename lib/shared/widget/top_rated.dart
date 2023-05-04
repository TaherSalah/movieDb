import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/color.dart';
import '../componts/constance.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class TopRatedMovie extends StatefulWidget {
  const TopRatedMovie({Key? key}) : super(key: key);

  @override
  State<TopRatedMovie> createState() => _TopRatedMovieState();
}

class _TopRatedMovieState extends State<TopRatedMovie> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).fetchTopRated();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BlocProvider.of<MovieCubit>(context).topRatedResults;

        return Scaffold(
          backgroundColor: ColorStyle.primColor,
          body: Container(
            margin: const EdgeInsets.all(15),
            child: CarouselSlider.builder(
              itemCount: list.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 300,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                reverse: false,
                aspectRatio: 5.0,
              ),
              itemBuilder: (context, i, id) {
                //for onTap to redirect to another screen
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    //ClipRRect for image border radius
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            '$imageUrl${list[i].posterPath}',
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                list[i].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.orange),
                              ),
                            )),
                      ],
                    ),
                  ),
                  onTap: () {
                    // ignore: avoid_print
                    print('this is $i');
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
