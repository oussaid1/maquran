import 'package:maquran/components.dart';

@HiveType(typeId: 1)
class UserConf extends HiveType {
  @HiveField(0, defaultValue: 0)
  String? userId = '0';
  @HiveField(1, defaultValue: 0)
  int? pageIndex = 0;
  @HiveField(2, defaultValue: '#ff0000')
  String? favColor = '#ff0000';
  @HiveField(3, defaultValue: 16)
  int? fontSize = 16;
  @HiveField(4, defaultValue: 0)
  int? readingStyle = 0;
  @HiveField(5, defaultValue: <int>[])
  List<int>? bookmarks = [];

  UserConf({required int typeId}) : super(typeId: typeId);

  // fromMap method

}
