import 'package:flutter/material.dart';
import 'package:wallpaper_app/api/api_services.dart';
import 'package:wallpaper_app/data/list_catagory.dart';
import 'package:wallpaper_app/widgets/catagory_widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    apiService.getTranding();
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'D',
              style:
                  TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
            ),
            const Text('allpaper', style: TextStyle(color: Colors.blue))
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            //------------------------ Search Bar -----------------
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(35)),
              margin: const EdgeInsets.only(left: 25, right: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'search your wallpaper',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //------------------- quick search -------------------
            Container(
              height: 200,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catagoryData.length,
                  itemBuilder: ((context, index) {
                    return MyCatagory(
                        imgSrc: catagoryData[index][1],
                        tittle: catagoryData[index][0]);
                  })),
            ),

            //--------------------- Results ----------------------
          ],
        ),
      ),
    );
  }
}
