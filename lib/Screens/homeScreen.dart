import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Constant-Widgets/cards/blood_group_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://img.freepik.com/free-vector/happy-world-blood-donor-day-red-white-black-background-social-media-design-banner-free-vector_1340-21636.jpg?size=626&ext=jpg&uid=R107090669&ga=GA1.1.1948187877.1675699674&semt=ais',
    'https://img.freepik.com/free-vector/happy-world-blood-donor-day-red-black-white-background-social-media-design-banner-free-vector_1340-21497.jpg?size=626&ext=jpg&uid=R107090669&ga=GA1.1.1948187877.1675699674&semt=ais',
    'https://img.freepik.com/free-vector/world-blood-donor-day-medical-elements-design_1035-23348.jpg?size=626&ext=jpg&uid=R107090669&ga=GA1.1.1948187877.1675699674&semt=ais',
    'https://img.freepik.com/free-vector/hand-drawn-world-blood-donor-day-illustration_23-2148939706.jpg?size=626&ext=jpg&uid=R107090669&ga=GA1.1.1948187877.1675699674&semt=ais'
  ];

  CarouselController buttonCarouselController = CarouselController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.red[900]!,
              Colors.red[900]!,
              Colors.red[600]!,
              Colors.red[300]!,
              Colors.red[900]!,
              Colors.red[900]!,
            ])),
        child: Column(
          children: [
            ClipRect(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.redAccent,
                      Colors.redAccent,
                      Colors.red,
                    ],
                  ),
                ),
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Available Blood\n300',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BloodGroupCard(
                  cardName: 'A+',
                ),
                BloodGroupCard(
                  cardName: 'B+',
                ),
                BloodGroupCard(
                  cardName: 'AB+',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BloodGroupCard(
                  cardName: 'A-',
                ),
                BloodGroupCard(
                  cardName: 'B-',
                ),
                BloodGroupCard(
                  cardName: 'AB-',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BloodGroupCard(
                  cardName: 'O+',
                ),
                BloodGroupCard(
                  cardName: 'O-',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
