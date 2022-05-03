import 'package:flutter/material.dart';
import 'package:maquran/models/pagemodel.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          itemBuilder: (context, index) {
            List<QPage> pages = QPage.fromJson();
            return Container(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                pages[index].image!,
                fit: BoxFit.cover,
              ),
            );
          },

          separatorBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.all(4),
              height: height * 0.06,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Center(
                child: Text(
                  'صفحة رقم ${index + 1}',
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          itemCount: QPage.fromJson().length, //pages.length,
        ),
      ),
    );
  }
}
