import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'iconwidget.dart';

class IconTap extends StatelessWidget {
  const IconTap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Iconwidget(
            title: 'forest',
            color: Colors.lightGreenAccent,
            icon: Icons.forest),
        SizedBox(
          width: 15,
        ),
        Iconwidget(
            title: 'camping', color: Colors.greenAccent, icon: Icons.campaign),
        SizedBox(
          width: 15,
        ),
        Iconwidget(
            title: 'Boat trip',
            color: Colors.lightGreenAccent,
            icon: Icons.trip_origin),
        SizedBox(
          width: 15,
        ),
        Iconwidget(
            title: 'Hiking', color: Colors.greenAccent, icon: Icons.compress),
        SizedBox(
          width: 15,
        ),
        Iconwidget(
            title: 'World tour',
            color: Colors.lightGreenAccent,
            icon: Icons.tour),
      ],
    );
  }
}
