import 'package:flutter/material.dart';

import '../componts/color.dart';

Widget mainTitle({required String startTitle, String? endTitle }) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          startTitle,
          style: const TextStyle(
              color: ColorStyle.oraColor,
              fontSize: 18,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                  color: ColorStyle.scoColor,
                  fontSize: 16,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.w500),
            )),
      ],
    ),
  )
  ;

}