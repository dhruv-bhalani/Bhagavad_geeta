import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  static ShrHelper shrHelper = ShrHelper();
  shareIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    await shr.setBool('introShare', true);
  }

  Future<bool?> introStatus() async {
    SharedPreferences share = await SharedPreferences.getInstance();

    bool? status = share.getBool('introShare');
    return status;
  }

  void themeset(bool val) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("themes", val);
  }

  Future<bool?> themeget() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? val = shr.getBool("themes");
    return val;
  }
}
