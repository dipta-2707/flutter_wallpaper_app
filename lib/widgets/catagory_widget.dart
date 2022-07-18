import 'package:flutter/material.dart';

class MyCatagory extends StatelessWidget {
  final String imgSrc;
  final String tittle;
  const MyCatagory({Key? key, required this.imgSrc, required this.tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imgSrc,
            width: 100,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black26,
          ),
          alignment: Alignment.center,
          width: 100,
          height: 50,
          child: Text(
            tittle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        )
      ]),
    );
  }
}
