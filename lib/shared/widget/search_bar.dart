import 'package:flutter/material.dart';

import '../componts/color.dart';

Widget searchBarWidget() {
  return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: ColorStyle.grayColor, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        style: const TextStyle(color: ColorStyle.oraColor),
        decoration: const InputDecoration(
            hintText: 'Search any Movies',
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white24, fontSize: 12),
            label: Text(
              'Search',
              style: TextStyle(color: Colors.white),
            )),
        onTap: () {
          print('object');
        },
      ));
}
