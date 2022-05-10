import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  UserConf({
    this.userId,
    this.pageIndex,
    this.favColor,
    this.fontSize,
    this.readingStyle,
    this.bookmarks,
  }) : super(typeId: 1);
// a static default UserConf
  static UserConf defaultUserConf() {
    return UserConf(
      userId: '0',
      pageIndex: 0,
      favColor: '#ff0000',
      fontSize: 16,
      readingStyle: 0,
      bookmarks: [],
    );
    // fromMap method
  }

  UserConf copyWith({
    String? userId,
    int? pageIndex,
    String? favColor,
    int? fontSize,
    int? readingStyle,
    List<int>? bookmarks,
  }) {
    return UserConf(
      userId: userId ?? this.userId,
      pageIndex: pageIndex ?? this.pageIndex,
      favColor: favColor ?? this.favColor,
      fontSize: fontSize ?? this.fontSize,
      readingStyle: readingStyle ?? this.readingStyle,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'pageIndex': pageIndex,
      'favColor': favColor,
      'fontSize': fontSize,
      'readingStyle': readingStyle,
      'bookmarks': bookmarks,
    };
  }

  factory UserConf.fromMap(Map<String, dynamic> map) {
    return UserConf(
      userId: map['userId'],
      pageIndex: map['pageIndex']?.toInt(),
      favColor: map['favColor'],
      fontSize: map['fontSize']?.toInt(),
      readingStyle: map['readingStyle']?.toInt(),
      bookmarks: List<int>.from(map['bookmarks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserConf.fromJson(String source) =>
      UserConf.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserConf(userId: $userId, pageIndex: $pageIndex, favColor: $favColor, fontSize: $fontSize, readingStyle: $readingStyle, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserConf &&
        other.userId == userId &&
        other.pageIndex == pageIndex &&
        other.favColor == favColor &&
        other.fontSize == fontSize &&
        other.readingStyle == readingStyle &&
        listEquals(other.bookmarks, bookmarks);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        pageIndex.hashCode ^
        favColor.hashCode ^
        fontSize.hashCode ^
        readingStyle.hashCode ^
        bookmarks.hashCode;
  }
}
