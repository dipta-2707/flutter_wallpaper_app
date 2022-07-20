import 'package:flutter/material.dart';
import 'package:wallpaper_app/api/api_services.dart';
import 'package:wallpaper_app/data/list_catagory.dart';
import 'package:wallpaper_app/model/wallpapers_model.dart';
import 'package:wallpaper_app/widgets/catagory_widget.dart';
import 'package:wallpaper_app/widgets/image_grid_widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    // TODO: implement initState
    super.initState();
    //_searchController.text = "deafult";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
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
      body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search your wallpaper',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: const Icon(Icons.search),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //------------------- quick search -------------------
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
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return GridView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data["photos"].length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 6.0,
                                      crossAxisSpacing: 6.0),
                              itemBuilder: (context, index) {
                                return GridTile(
                                    child: Container(
                                  child: Image.network(
                                      snapshot.data["photos"][index]["src"]
                                          ["portrait"],
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }),
                                ));
                              });
                        default:
                          return const LinearProgressIndicator();
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
