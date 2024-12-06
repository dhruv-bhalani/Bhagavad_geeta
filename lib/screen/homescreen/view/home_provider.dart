import 'package:bhagavat_geeta/helper/helper.dart';
import 'package:bhagavat_geeta/model/model.dart';
import 'package:bhagavat_geeta/utils/shrHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeProvider extends ChangeNotifier {
  List<BhagavatGeetaModel> bhagavatgeeta = [];
  List<BhagavatGeetaModel> selectVerseList = [];
  List<BhagavatGeetachaptersModel> chapter = [];
  FlutterTts tts = FlutterTts();
  List<List> images = [
    [
      "assets/images/ch_1(1).jpg",
      "assets/images/ch_1(2).jpg",
      "assets/images/ch_1(3).jpg",
    ],
    [
      "assets/images/ch_2(1).jpg",
      "assets/images/ch_2(2).jpg",
      "assets/images/ch_2(3).jpg",
    ],
    [
      "assets/images/ch_3(1).jpg",
      "assets/images/ch_3(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_4(1).jpg",
      "assets/images/ch_4(2).jpg",
      "assets/images/ch_4(3).jpg",
    ],
    [
      "assets/images/ch_5(1).jpg",
      "assets/images/ch_5(2).jpg",
      "assets/images/ch_5(3).jpg",
    ],
    [
      "assets/images/ch_6(1).jpg",
      "assets/images/ch_6(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_7(1).jpg",
      "assets/images/ch_7(2).jpg",
      "assets/images/ch_2(2).jpg",
    ],
    [
      "assets/images/ch_8(1).jpg",
      "assets/images/ch_8(2).jpg",
      "assets/images/ch_8(3).jpg",
    ],
    [
      "assets/images/ch_9(1).jpg",
      "assets/images/ch_9(2).jpg",
      "assets/images/ch_9(3).jpg",
    ],
    [
      "assets/images/ch_10(1).jpg",
      "assets/images/ch_10(2).jpg",
      "assets/images/ch_10(3).jpg",
    ],
    [
      "assets/images/ch_11(1).jpg",
      "assets/images/ch_11(2).jpg",
      "assets/images/ch_11(3).jpg",
    ],
    [
      "assets/images/ch_12(1).jpg",
      "assets/images/ch_12(2).jpg",
      "assets/images/ch_12(3).jpg",
      "assets/images/ch_12(4).jpg",
    ],
    [
      "assets/images/ch_13(1).jpg",
      "assets/images/ch_13(2).jpg",
      "assets/images/ch_13(3).jpg",
    ],
    [
      "assets/images/ch_14(1).jpg",
      "assets/images/ch_14(2).jpg",
      "assets/images/ch_14(3).jpg",
    ],
    [
      "assets/images/ch_15(1).jpg",
      "assets/images/ch_15(2).jpg",
    ],
    [
      "assets/images/ch_16(1).jpg",
      "assets/images/ch_16(2).jpg",
      "assets/images/ch_16(3).jpg",
    ],
    [
      "assets/images/ch_17(1).jpg",
      "assets/images/ch_17(2).jpg",
      "assets/images/ch_17(3).jpg",
    ],
    [
      "assets/images/ch_18(1).jpg",
      "assets/images/ch_18(2).jpg",
      "assets/images/ch_18(3).jpg",
    ],
  ];
  bool isHindi = false;
  void getHindi(bool val) {
    isHindi = !isHindi;
    notifyListeners();
  }

  bool languagechenge = false;
  bool isdarkmode = false;

  void changeTheme(bool val) {
    isdarkmode = val;
    ShrHelper.shrHelper.themeset(val);
    notifyListeners();
  }

  Future<void> checkTheme() async {
    bool? val = await ShrHelper.shrHelper.themeget();
    isdarkmode = val!;
    notifyListeners();
  }

  Future<void> getbhagavatjson() async {
    Helper helper = Helper();
    bhagavatgeeta = await helper.json();
    notifyListeners();
  }

  void selectVerse(int index) {
    selectVerseList = bhagavatgeeta
        .where((element) => element.chapter_number == index)
        .toList();
    notifyListeners();
  }

  Future<void> getchapterjson() async {
    Helper helper = Helper();
    chapter = await helper.chapter();
    notifyListeners();
  }

  void speak(String text) async {
    await tts.speak(text);
  }

  void pause() async {
    await tts.pause();
  }
}
