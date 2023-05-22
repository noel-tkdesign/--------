import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplay/adbanner.dart';
import 'package:audioplay/setting.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  final audioPlayer = AudioPlayer();
  bool isAnswer = true;
  bool isNoAnswer = true;
  String isSelectedValue = 'サウンド１';
  String isSelectedAnimation = 'アニメ1';

  Widget ifAnimation() {
    if (isAnswer == false) {
      return Lottie.asset(
        isSelectedAnimation == "アニメ1"
            ? 'assets/141002-correct.json'
            : 'assets/108348-quiz-correct.json',
        fit: BoxFit.fill,
      );
    } else if (isNoAnswer == false) {
      return Lottie.asset(
        isSelectedAnimation == "アニメ1"
            ? 'assets/141005-incorrect.json'
            : 'assets/108351-quiz-incorrect.json',
        fit: BoxFit.fill,
      );
    } else {
      return Lottie.asset(
        isSelectedAnimation == "アニメ1"
            ? 'assets/108512-qa-loader.json'
            : 'assets/107275-question-and-answer-q-a.json',
        fit: BoxFit.fill,
      );
    }
  }

  Widget ifText() {
    if (isAnswer == false) {
      return const Text(
        '正解です !!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else if (isNoAnswer == false) {
      return const Text(
        "不正解です...",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        ' 答えは？ ',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
    }
  }

  Widget ifTextAnimation() {
    if (isAnswer == false) {
      return Lottie.asset('assets/119540-correct-answer.json',
          height: 80, width: double.infinity);
    } else if (isNoAnswer == false) {
      return Lottie.asset('assets/119539-incorrect-answer.json', height: 80);
    } else {
      return SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedTextKit(
            animatedTexts: [
              ScaleAnimatedText(
                'Answer?',
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 165, 165)),
              ),
            ],
            repeatForever: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 232, 249),
      appBar: AppBar(
        centerTitle: true,
        title: ifText(),
        backgroundColor: Color.fromARGB(255, 210, 232, 249),
        elevation: 0,
        foregroundColor: Colors.black,
        /* actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            }, //追加
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ifText(),
              ifTextAnimation(),
              Container(
                width: 350,
                height: 380,
                child: ifAnimation(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      audioPlayer.play(
                        AssetSource(isSelectedValue == 'サウンド１'
                            ? "pinpon3.mp3"
                            : "pinpon1.mp3"),
                      );
                      setState(() {
                        isAnswer = false;
                        if (isNoAnswer == false) {
                          isNoAnswer = true;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.thumb_up_alt,
                    ),
                    label: Text(
                      "正解(correct)",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(197, 255, 0, 0),
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      audioPlayer.play(
                        AssetSource(isSelectedValue == "サウンド１"
                            ? "bubbu1.mp3"
                            : "bubbu2.mp3"),
                      );
                      setState(() {
                        isNoAnswer = false;
                        if (isAnswer == false) {
                          isAnswer = true;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.thumb_down_alt,
                    ),
                    label: Text(
                      '不正解(incorrect)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(197, 0, 128, 255),
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
              AdBannerTop(size: AdSize.banner),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (isAnswer == false) {
                      isAnswer = true;
                    } else if (isNoAnswer == false) {
                      isNoAnswer = true;
                    }
                  });
                },
                child: const Text("リセット"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('音の種類'),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'サウンド１',
                              child: Text('サウンド１'),
                            ),
                            DropdownMenuItem(
                              value: 'サウンド２',
                              child: Text('サウンド２'),
                            ),
                          ],
                          value: isSelectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              isSelectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('アニメーション'),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 150,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'アニメ1',
                              child: Text('アニメ1'),
                            ),
                            DropdownMenuItem(
                              value: 'アニメ2',
                              child: Text('アニメ2'),
                            ),
                          ],
                          value: isSelectedAnimation,
                          onChanged: (String? value) {
                            setState(() {
                              isSelectedAnimation = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              AdBannerTop(size: AdSize.banner)
            ],
          ),
        ),
      ),
    );
  }
}
