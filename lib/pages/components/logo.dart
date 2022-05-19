import 'package:flutter/material.dart';

class LogoImageAsset extends StatelessWidget {
  final double height;
  final AlignmentGeometry align;

  const LogoImageAsset({Key? key,
    required this.height, required this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/logo-aubooks.png');
    Image image = Image(image: assetImage, height: height);
    return Container(
      alignment: align,
      child: image,
    );
  }
}