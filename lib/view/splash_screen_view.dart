import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});

    if (await Permission.storage.request().isGranted) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home/');
    } else {
      var status = await Permission.storage.status;
      if (status.isGranted) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home/');
      } else if (status.isDenied) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('need storage permisson to save image')));
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/app_logo.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Wallpaper',
                      style: TextStyle(color: Color(0xff8CCEEB), fontSize: 18),
                    ),
                    const Text('POOL',
                        style: TextStyle(
                            color: Color(0xff003061),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Developed by '),
                Text(
                  'Dipta Das',
                  style: TextStyle(color: Color(0xff8CCEEB)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
