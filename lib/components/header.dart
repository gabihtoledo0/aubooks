import 'package:flutter/material.dart';

class HeaderImageAsset extends StatelessWidget {
  const HeaderImageAsset({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      AssetImage assetImage = AssetImage('images/header.png');
      Image image = Image(image: assetImage, height: 200,
      fit:BoxFit.fitWidth);
      return Container(
          child: image,
      );
  }
}
