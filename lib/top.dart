import 'package:audioplay/adbanner.dart';
import 'package:audioplay/answer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 232, 249),
      //appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'クイズ○×ブザー',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'クイズやパーティーで使えるブザーアプリ！！',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: 20,
              ),
              Lottie.asset('assets/115654-succes-checkmark-animation.json',
                  height: 400, width: 400),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.manage_search,
                    ),
                    label: Text(
                      '使ってみる',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Answer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              AdBannerTop(size: AdSize.largeBanner)
            ],
          ),
        ),
      ),
    );
  }
}
