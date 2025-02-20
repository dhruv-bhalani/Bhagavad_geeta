import 'dart:convert';

import 'package:bhagavat_geeta/model/chaptermodel.dart';
import 'package:bhagavat_geeta/model/versesmodel.dart';
import 'package:bhagavat_geeta/utils/shrHelper.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  Future<List<VersesModel>> json() async {
    String jsonString = await rootBundle.loadString('assets/json/verses.json');

    List json = jsonDecode(jsonString);

    List<VersesModel> bhagavatGeetaList =
        json.map((e) => VersesModel.mapToModel(e)).toList();
    return bhagavatGeetaList;
  }

  Future<List<ChapterModel>> chapter() async {
    String jsonString =
        await rootBundle.loadString('assets/json/chapters.json');

    List json = jsonDecode(jsonString);

    List<ChapterModel> bhagavatList =
        json.map((e) => ChapterModel.mapToModel(e)).toList();
    return bhagavatList;
  }
}
