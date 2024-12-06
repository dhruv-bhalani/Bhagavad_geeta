import 'dart:convert';

import 'package:bhagavat_geeta/model/model.dart';
import 'package:bhagavat_geeta/utils/shrHelper.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  Future<List<BhagavatGeetaModel>> json() async {
    String jsonString = await rootBundle.loadString('assets/json/verses.json');

    List json = jsonDecode(jsonString);

    List<BhagavatGeetaModel> bhagavatGeetaList =
        json.map((e) => BhagavatGeetaModel.fromJson(e)).toList();
    return bhagavatGeetaList;
  }

  Future<List<BhagavatGeetachaptersModel>> chapter() async {
    String jsonString =
        await rootBundle.loadString('assets/json/chapters.json');

    List json = jsonDecode(jsonString);

    List<BhagavatGeetachaptersModel> bhagavatList =
        json.map((e) => BhagavatGeetachaptersModel.fromJson(e)).toList();
    return bhagavatList;
  }
}
