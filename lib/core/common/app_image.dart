import 'package:flutter/widgets.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit? fit;
  const AppImage({super.key,required this.image,required this.height,required this.width,this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,height: height,width: width,fit:fit?? BoxFit.cover,);
  }
}