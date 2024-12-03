import 'package:bhagavat_geeta/helper/helper.dart';
import 'package:bhagavat_geeta/model/model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<BhagavatGeetaModel> bhagavatgeeta = [];
  List<BhagavatGeetaModel> chapter = [];

  Future<void> getbhagavatjson() async {
    Helper helper = Helper();
    bhagavatgeeta = await helper.json();
    notifyListeners();
  }

  Future<void> getchapterjson() async {
    Helper helper = Helper();
    bhagavatgeeta = await helper.chapter();
    notifyListeners();
  }
}
