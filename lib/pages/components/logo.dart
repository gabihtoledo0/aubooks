import 'package:flutter/material.dart';

class LogoImageAsset extends StatelessWidget {
  final double height;

  const LogoImageAsset({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/logo-aubooks.png');
    Image image = Image(image: assetImage, height: height);
    return Container(
      alignment: Alignment.center,
      child: image,
    );
  }
}
