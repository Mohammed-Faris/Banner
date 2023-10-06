import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerComponent extends StatefulWidget {
  const BannerComponent({
    super.key,
    required String title,
  });

  @override
  State<BannerComponent> createState() => _BannerComponentState();
}

class _BannerComponentState extends State<BannerComponent> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> bannerItems = [
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
    {
      'text': 'Floating Rate Savings Bond 2020(FRSB) Launched',
      'icon': Icons.store_rounded,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Banner'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          CarouselSlider(
            items: bannerItems.map((item) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 12.0),
                    const SizedBox(height: 8.0),
                    Text(
                      item['text'],
                      style: const TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 80.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerItems.map((item) {
              int index = bannerItems.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 2.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.black
                      : Colors.grey.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
