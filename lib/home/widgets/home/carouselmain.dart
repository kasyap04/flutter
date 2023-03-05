import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ridhiks/colors.dart';

class CarouselMain extends StatefulWidget {
  @override
  State<CarouselMain> createState() => CarouselMainState();
}

class CarouselMainState extends State<CarouselMain> {
  int curoselItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> caroselItems = <Widget>[
      CauroselItemView(),
      CauroselItemView(),
      CauroselItemView()
    ];

    return Column(
      children: [
        CarouselSlider(
          items: caroselItems,
          disableGesture: false,
          options: CarouselOptions(
              height: 180,
              enableInfiniteScroll: false,
              scrollPhysics: BouncingScrollPhysics(),
              // enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  curoselItemIndex = index;
                });
              }),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        CarouselIndicator(
          len: caroselItems.length,
          index: curoselItemIndex,
        )
      ],
    );
  }
}

class CauroselItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: AppColor().primaryBlue,
          borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.network(
            "https://www.pngmart.com/files/15/Apple-iPhone-12-PNG-Photo.png",
            // width: size.width / 2,
            height: 180 - 20,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.blue,
              margin: const EdgeInsets.only(top: 5),
              height: 180 - 105,
              width: (size.width / 2) - 20,
              child: const Text(
                "Special Deal For October",
                style: TextStyle(
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
                overflow: TextOverflow.visible,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, elevation: 0),
              child: Text(
                "Buy now",
                style: TextStyle(color: AppColor().primaryBlue, fontSize: 12),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class CarouselIndicator extends StatefulWidget {
  final int len;
  final int index;
  CarouselIndicator({required this.len, required this.index});
  @override
  State<CarouselIndicator> createState() => CarouselIndicatorState();
}

class CarouselIndicatorState extends State<CarouselIndicator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [
      // IndicatorDot(currentIndex: true),
      // IndicatorDot(currentIndex: false),
      // IndicatorDot(currentIndex: false)
    ];

    for (var i = 0; i < widget.len; i++) {
      indicators
          .add(IndicatorDot(currentIndex: i == widget.index ? true : false));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool currentIndex;
  IndicatorDot({required this.currentIndex});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(3),
        height: 7,
        width: currentIndex == true ? 16 : 7,
        decoration: BoxDecoration(
            color: currentIndex == true
                ? AppColor().primaryBlue
                : AppColor().searchBarColor,
            borderRadius: BorderRadius.circular(50)),
      );
}
