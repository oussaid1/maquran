class QPage {
  int? id;
  String? title;
  String? content;
  String? image;
  QPage({this.id, this.title, this.content, this.image});
  static List<QPage> fromJson() {
    return qJson.map((e) => QPage.fromJsonMap(e)).toList();
  }

  static QPage fromJsonMap(Map<String, dynamic> json) {
    return QPage(
        id: json['id'] as int?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        image: json['image'] as String?);
  }

  static List<Map<String, dynamic>> get qJson {
    var json = <Map<String, dynamic>>[];
    json.add(
      {
        'id': 1,
        'title': 'القرآن الكريم',
        'content': '',
        'image': "assets/images/quran/pages/nullpage.png"
      },
    );
    json.add(
      {
        'id': 2,
        'title': 'الصفحة الأولى',
        'content': '',
        'image': "assets/images/quran/pages/cover.jpg"
      },
    );
    [
      for (var i = 3; i < 657; i++)
        {
          json.add({
            'id': i,
            'title': '$i الصفحة ',
            'content': 'content $i',
            'image': "assets/images/quran/pages/page$i.png",
          })
        }
    ];
    return json;
  }
}
