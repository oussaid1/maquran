import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../components.dart';
import '../models/userconf_model.dart';

final userConfNotifierProvider = Provider<UserConfNotifier>((ref) {
  return UserConfNotifier();
});

class UserConfNotifier extends ChangeNotifier {
  UserConfNotifier() {
    _userConf = UserConf.defaultUserConf();
    _init();
  }

  late UserConf _userConf;

  UserConf get userConf => _userConf;

  set userConf(UserConf userConf) {
    _userConf = userConf;
    notifyListeners();
  }

  void _init() async {
    var box = await Hive.openBox('userconf');
    _userConf = box.getAt(1);

    notifyListeners();
  }

  // // dispose the box
  void save({UserConf? userConf}) async {
    var box = await Hive.openBox('userconf');
    box.putAt(1, userConf ?? _userConf);
    box.close();
  }

  @override
  void dispose() {
    save();
    super.dispose();
    // dispose();
  }
}
