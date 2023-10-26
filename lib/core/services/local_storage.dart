import 'package:hive_flutter/hive_flutter.dart';

import '../models/login_model.dart';

class AppCache {
  static const String kUserBox = 'userBox';
  static const String kDefaultBox = 'defaultBox';
  static const String userKey = 'userKey';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
    await Hive.openBox<dynamic>(kDefaultBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);
  static Box<dynamic> get _defaultBox => Hive.box<dynamic>(kDefaultBox);

  static void setUser(LoginModel a) {
    _userBox.put(userKey, a.toJson());
  }

  static LoginModel? getUser() {
    dynamic d = _userBox.get(userKey);
    if (d == null) return null;
    return LoginModel.fromJson(d);
  }

  static Future<void> clear([bool all = false]) async {
    await _userBox.clear();
    if (all) await _defaultBox.clear();
  }
}
