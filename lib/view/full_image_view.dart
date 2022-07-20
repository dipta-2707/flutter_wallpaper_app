import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyFullImage extends StatelessWidget {
  final String imgSrc;
  const MyFullImage({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              imgSrc,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    print('saved');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 150,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(150, 35, 37, 38),
                          Color.fromARGB(150, 65, 67, 69)
                        ])),
                    child: Column(
                      children: const [
                        Text(
                          'Set Wallpaper',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'Image will save in gallary',
                          style: TextStyle(fontSize: 8, color: Colors.white60),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
