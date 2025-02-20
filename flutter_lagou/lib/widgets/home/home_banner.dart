import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/utility/screen.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';

class HomeBanner extends StatelessWidget {
  final List<BannerModel> bannerModels;
  final double height;
  final String placeholder;
  HomeBanner({Key? key,required this.bannerModels,required this.height,required this.placeholder}) :super(key:key);

  @override
  Widget build(BuildContext context) {

    if (bannerModels == null || bannerModels.length == 0) {
      return SizedBox();
    }

    return Container(
      alignment: Alignment.center,
      height: height,
      child: new BannerWidget(
        height: height,
        autoPlay: true,
        content: bannerModels.map((model){
          return Container(
            width: Screen.width,
            margin: new EdgeInsets.symmetric(horizontal: 0.0),
            child: FadeInImage.assetNetwork(
              placeholder: placeholder,
              image: model.imageUrl ?? '',
              fit: BoxFit.cover,
            )
          );
        }).toList(),
      )
    );
  }
}