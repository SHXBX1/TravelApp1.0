//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/destination.dart';

import '../widgets/Profile.dart';
import '../widgets/icontap.dart';
import '../widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //row 1
              const ProfileWidget(),

              const SizedBox(
                height: 15,
              ),
              //row 2
              Text(
                'Point of Interest',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              //row 3
              const SizedBox(
                height: 15,
              ),
              const Searchingbar(),
              const SizedBox(
                height: 20,
              ),
              //row 4
              const IconTap(),
              const SizedBox(
                height: 20,
              ),
              //Row5
              const Row(
                children: [
                  Text(
                    'Top destination',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: List.generate(destinations.length, (index) {
                  var e = destinations[index];

                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                            child: DestinationWidget(
                          name: e.name,
                          image: e.image,
                          rate: e.rate,
                          location: e.location,
                        )),
                      ));
                }),
              ), //Row6
            ],
          ),
        ),
      ),
    );
  }
}
