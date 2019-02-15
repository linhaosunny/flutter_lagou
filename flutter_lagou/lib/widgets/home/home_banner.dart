import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_lagou/widgets/model/banner_model.dart';
import 'package:flutter_lagou/widgets/utility/screen.dart';

class HomeBanner extends StatelessWidget {
  final List<BannerModel> bannerModels;

  HomeBanner(this.bannerModels);

  @override
  Widget build(BuildContext context) {

    if (bannerModels.length == 0) {
      return SizedBox();
    }

    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: bannerModels.map((model) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: Screen.width,
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  model.imageUrl ?? '',
                  fit: BoxFit.fill,
                ),
              );
            },
          );
        }).toList(),
        aspectRatio: 2,
        interval: const Duration(seconds: 5),
        autoPlay: true,
      ),
    );
  }
}