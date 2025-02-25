import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/destination.dart';
import '../widgets/Profile.dart';
import '../widgets/icontap.dart';
import '../widgets/search.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinationAPI = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      setState(() {
        destinationAPI = json.decode(response.body);
        isLoading = false;
        // print(destinationAPI);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

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
                children: List.generate(destinationAPI.length, (index) {
                  //var e = destinations[index];

                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                            child: DestinationWidget(
                          name: destinationAPI[index]['name'],
                          image: destinationAPI[index]['image'],
                          rate: destinationAPI[index]['rate'],
                          location: destinationAPI[index]['location'],
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
