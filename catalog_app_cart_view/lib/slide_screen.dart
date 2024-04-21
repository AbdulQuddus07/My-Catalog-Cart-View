import 'package:catalog_app_cart_view/components/component.dart';
import 'package:catalog_app_cart_view/main_cart_screen.dart';
import 'package:flutter/material.dart';

class MySliderView extends StatefulWidget {
  const MySliderView({super.key});
  @override
  State<MySliderView> createState() => _MySliderViewState();
}

class _MySliderViewState extends State<MySliderView> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 600,
                      ),
                      Text(
                        contents[i].title,
                        style:
                            const TextStyle(fontSize: 35, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                contents.length,
                (index) => Container(
                      margin: const EdgeInsets.all(3),
                      height: 10,
                      width: currentIndex == index ? 20 : 10,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => CartView()));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  height: 40,
                  width: 100,
                  child: InkWell(
                      child: currentIndex == contents.length - 1
                          ? Continue()
                          : Next(),
                      onTap: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartView()));
                        }
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FoodContent {
  String title;
  String image;
  FoodContent({
    required this.title,
    required this.image,
  });
}

List<FoodContent> contents = [
  FoodContent(
    title: "Fast Delivery",
    image: "assets/img.jpg",
  ),
  FoodContent(
    title: "Delicious Burger",
    image: "assets/imgs.jpg",
  ),
  FoodContent(
    title: "Best Pizza Services",
    image: "assets/img5.jpg",
  ),
];
