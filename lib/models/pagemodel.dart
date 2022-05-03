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
    return [
      {
        "id": 3,
        "title": "p1",
        "content": "content1",
        "image": "assets/images/quran/pages/page3.png"
      },
      {
        "id": 4,
        "title": "p2",
        "content": "content2",
        "image": "assets/images/quran/pages/page4.png"
      },
      {
        "id": 5,
        "title": "p3",
        "content": "content3",
        "image": "assets/images/quran/pages/page5.png"
      },
      {
        "id": 6,
        "title": "p4",
        "content": "content4",
        "image": "assets/images/quran/pages/page6.png"
      },
      {
        "id": 7,
        "title": "p5",
        "content": "content5",
        "image": "assets/images/quran/pages/page7.png"
      },
      {
        "id": 8,
        "title": "p6",
        "content": "content6",
        "image": "assets/images/quran/pages/page8.png"
      },
      {
        "id": 9,
        "title": "p7",
        "content": "content7",
        "image": "assets/images/quran/pages/page9.png"
      },
      {
        "id": 10,
        "title": "p8",
        "content": "content8",
        "image": "assets/images/quran/pages/page10.png"
      },
      {
        "id": 11,
        "title": "p9",
        "content": "content9",
        "image": "assets/images/quran/pages/page11.png"
      },
      {
        "id": 12,
        "title": "p10",
        "content": "content10",
        "image": "assets/images/quran/pages/page12.png"
      },
      {
        "id": 13,
        "title": "p11",
        "content": "content11",
        "image": "assets/images/quran/pages/page13.png"
      },
      {
        "id": 14,
        "title": "p12",
        "content": "content12",
        "image": "assets/images/quran/pages/page14.png"
      },
      {
        "id": 15,
        "title": "p13",
        "content": "content13",
        "image": "assets/images/quran/pages/page15.png"
      },
      {
        "id": 16,
        "title": "p14",
        "content": "content14",
        "image": "assets/images/quran/pages/page16.png"
      },
      {
        "id": 17,
        "title": "p15",
        "content": "content15",
        "image": "assets/images/quran/pages/page17.png"
      },
      {
        "id": 18,
        "title": "p16",
        "content": "content16",
        "image": "assets/images/quran/pages/page18.png"
      },
      {
        "id": 19,
        "title": "p17",
        "content": "content17",
        "image": "assets/images/quran/pages/page19.png"
      },
      {
        "id": 20,
        "title": "p18",
        "content": "content18",
        "image": "assets/images/quran/pages/page20.png"
      },
      {
        "id": 21,
        "title": "p19",
        "content": "content19",
        "image": "assets/images/quran/pages/page21.png"
      },
      {
        "id": 22,
        "title": "p20",
        "content": "content20",
        "image": "assets/images/quran/pages/page22.png"
      },
      {
        "id": 23,
        "title": "p21",
        "content": "content21",
        "image": "assets/images/quran/pages/page23.png"
      },
      {
        "id": 24,
        "title": "p22",
        "content": "content22",
        "image": "assets/images/quran/pages/page24.png"
      },
      {
        "id": 25,
        "title": "p23",
        "content": "content23",
        "image": "assets/images/quran/pages/page25.png"
      },
      {
        "id": 26,
        "title": "p24",
        "content": "content24",
        "image": "assets/images/quran/pages/page26.png"
      },
      {
        "id": 27,
        "title": "p25",
        "content": "content25",
        "image": "assets/images/quran/pages/page27.png"
      },
      {
        "id": 28,
        "title": "p26",
        "content": "content26",
        "image": "assets/images/quran/pages/page28.png"
      },
      {
        "id": 29,
        "title": "p27",
        "content": "content27",
        "image": "assets/images/quran/pages/page29.png"
      },
      {
        "id": 30,
        "title": "p28",
        "content": "content28",
        "image": "assets/images/quran/pages/page30.png"
      },
      {
        "id": 31,
        "title": "p29",
        "content": "content29",
        "image": "assets/images/quran/pages/page31.png"
      },
      {
        "id": 32,
        "title": "p30",
        "content": "content30",
        "image": "assets/images/quran/pages/page32.png"
      },
    ];
  }
}
