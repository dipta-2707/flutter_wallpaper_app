import 'package:flutter/material.dart';

class MyGridTile extends StatelessWidget {
  final String imgSrc;
  const MyGridTile({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        // ignore: avoid_unnecessary_containers
        child: Container(
      child: Image.network(imgSrc, fit: BoxFit.cover, loadingBuilder:
          (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        //return const Center(child: CircularProgressIndicator());
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffD3CCE3), Color(0xffE9E4F0)])),
        );
      }),
    ));
  }
}
