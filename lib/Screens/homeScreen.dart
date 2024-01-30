import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant-Widgets/cards/blood_group_home_card.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/models/blood_info.dart';

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
      body: Column(
        children: [
          ClipRect(
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
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(23)),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                ],
              ),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 23,
                ),
                Text(
                  'Available Blood',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            ref
                .watch(bloodDonateRepositoryControllerProvider)
                .updateBloodCount();
            BloodInfoModel model = ref.watch(bloodInfoModelProvider);

            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BloodGroupHomeCard(
                        bloodType: 'A+ve',
                        count: model.ap.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'B+ve',
                        count: model.bp.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'AB+ve',
                        count: model.abp.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'O+ve',
                        count: model.op.toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BloodGroupHomeCard(
                        bloodType: 'A-ve ',
                        count: model.an.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'B-ve ',
                        count: model.bn.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'AB-ve ',
                        count: model.abn.toString(),
                      ),
                      BloodGroupHomeCard(
                        bloodType: 'O-ve ',
                        count: model.on.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
