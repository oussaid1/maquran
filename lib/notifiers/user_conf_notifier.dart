import 'package:flutter/material.dart';

import '../components.dart';
import '../models/userconf_model.dart';

class UserConfNotifier extends ChangeNotifier {
  UserConfNotifier() {
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
  void save() async {
    var box = await Hive.openBox('userconf');
    box.putAt(1, _userConf);
    box.close();
  }

  @override
  void dispose() {
    save();
    super.dispose();
    // dispose();
  }
}
