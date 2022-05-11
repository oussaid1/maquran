import '../components.dart';

// final userConfNotifierProvider = Provider<UserConfNotifier>((ref) {
//   return UserConfNotifier();
// });

class UserConfPageIndex {
  UserConfPageIndex() {
    _readingIndex = 0;
    init();
  }

  late int _readingIndex;

  int get userReadingIndex => _readingIndex;

  set readingIndex(int readingIndex) {
    _readingIndex = readingIndex;
  }

  init() async {
    var box = await Hive.openBox('userconf');
    _readingIndex = box.get('readingIndex') ?? 0;
  }

  // // dispose the box
  save({int? readingIndex}) async {
    var box = await Hive.openBox('userconf');
    box.put('readingIndex', readingIndex ?? _readingIndex);
    box.close();
  }
}

// class UserConfNotifier extends ChangeNotifier {
//   UserConfNotifier() {
//     _userConf = UserConf.defaultUserConf();
//     _init();
//   }

//   late UserConf _userConf;

//   UserConf get userConf => _userConf;

//   set userConf(UserConf userConf) {
//     _userConf = userConf;
//     notifyListeners();
//   }

//   void _init() async {
//     var box = await Hive.openBox('userconf');
//     _userConf = box.getAt(1);

//     notifyListeners();
//   }

//   // // dispose the box
//   void save({UserConf? userConf}) async {
//     var box = await Hive.openBox('userconf');
//     box.putAt(0, userConf ?? _userConf);
//     box.close();
//   }

//   @override
//   void dispose() {
//     save();
//     super.dispose();
//     // dispose();
//   }
// }
