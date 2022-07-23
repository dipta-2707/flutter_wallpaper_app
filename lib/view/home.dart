import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/api/api_services.dart';
import 'package:wallpaper_app/controller/grid_controller.dart';
import 'package:wallpaper_app/data/list_catagory.dart';
import 'package:wallpaper_app/view/full_image_view.dart';
import 'package:wallpaper_app/widgets/catagory_widget.dart';
import 'package:wallpaper_app/widgets/grid_tile.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late TextEditingController _searchController;
  final ScrollController _scrollController = ScrollController();
  // Grid State controller
  final MyController _myController = MyController();

  //int _pageNumber = 1;
  @override
  void initState() {
    _searchController = TextEditingController();
    // TODO: implement initState
    super.initState();
    // _imageLink.clear();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  _loadMore() {
    //_pageNumber = _pageNumber + 1;
    // _myController.increasePageNumber();
    if (_myController.totalImage < 48) {
      _myController.increaseListIteamNumber();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
    _myController.dispose();
    //_imageLink.clear();
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
            Container(
              margin: const EdgeInsets.only(right: 7.0),
              child: Image.asset(
                'assets/app_logo.png',
                height: 32,
                width: 32,
              ),
            ),
            const Text(
              'Wallpaper',
              style: TextStyle(color: Color(0xff8CCEEB)),
            ),
            const Text('POOL',
                style: TextStyle(
                    color: Color(0xff003061), fontWeight: FontWeight.bold))
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
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
                  controller: _searchController,
                  onSubmitted: (_) {
                    // setState(() {
                    //   _myController.imagesList.clear();
                    // });

                    _myController.clearTotalImageValue();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search your wallpaper',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _myController.clearTotalImageValue();
                          setState(() {});
                        },
                        icon: const Icon(Icons.search),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //------------------- quick search ------------------

              Container(
                //color: Colors.red,
                height: 50,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catagoryData.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          //print(catagoryData[index][0]);
                          _searchController.text = catagoryData[index][0];
                          setState(() {});
                        },
                        child: MyCatagory(
                            imgSrc: catagoryData[index][1],
                            tittle: catagoryData[index][0]),
                      );
                    })),
              ),

              //--------------------- Results ----------------------
              const SizedBox(
                height: 10,
              ),

              Container(
                //color: Colors.blue,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: FutureBuilder(
                    future: ApiService().fetchTranding(_searchController.text),
                    builder: (context, AsyncSnapshot snapshot) {
                      try {
                        _myController.imagesList.clear();
                        for (var i = 0;
                            i < snapshot.data["photos"].length;
                            i++) {
                          _myController.imagesList.add(
                              snapshot.data["photos"][i]["src"]["portrait"]);
                        }

                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            return Obx(() => GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _myController.totalImage.toInt(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.6,
                                        mainAxisSpacing: 6.0,
                                        crossAxisSpacing: 6.0),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyFullImage(
                                                      imgSrc: _myController
                                                          .imagesList[index]
                                                          .toString(),
                                                    )));
                                      },
                                      child: MyGridTile(
                                          imgSrc:
                                              _myController.imagesList[index]));
                                }));
                          default:
                            return const LinearProgressIndicator();
                        }
                      } catch (_) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/no_internet.gif',
                                height: 100,
                                width: 100,
                              ),
                              const Text('No internet Connection')
                            ],
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
