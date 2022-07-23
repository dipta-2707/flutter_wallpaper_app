import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyGridTile extends StatelessWidget {
  final String imgSrc;
  const MyGridTile({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Container(
      child: Image.network(imgSrc, fit: BoxFit.cover, loadingBuilder:
          (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(child: CircularProgressIndicator());
      }),
    ));
  }
}
