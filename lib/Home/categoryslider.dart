import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vistox/Modal/homemodal.dart';

class CategorySlider extends StatefulWidget {
  CategorySlider({Key? key, required this.data}) : super(key: key);
  List<SliderimgModal> data;

  @override
  _CategorySliderState createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int ci = 0;

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      "https://soliloquywp.com/wp-content/uploads/2018/10/nb_dfs_2.jpg",
      "https://soliloquywp.com/wp-content/uploads/2018/10/nb_dfs_4.jpg",
      "https://mitracafe.co.in/wp-content/uploads/2021/12/slide2.jpg"
    ];
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, "/bundlecreatorPage",
            //     arguments: {'id': '1', 'index': '1'});
          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (int i, G) {
                      setState(() {
                        ci = i;
                      });
                    },
                    //onPageChanged: (int index) {},
                    //height: size.width / 2,
                    aspectRatio: 5 / 2,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    //onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: List.generate(
                    widget.data.length,
                    (index) => InkWell(
                        // onTap: () {
                        //   Navigator.pushNamed(context, '/categorylist',
                        //       arguments: {'id': (widget.data![index].cat).toString()});
                        // },
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        image[index],
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset('assets/b1.png'),
                        fit: BoxFit.fill,
                      ),
                    )),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              image.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 20,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ci == index ? Colors.red : Colors.grey),
                    ),
                  )),
        ),
      ],
    );
  }
}
