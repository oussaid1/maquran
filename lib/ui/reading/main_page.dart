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
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            // SliverAppBar(
            //   leading: const BackButton(
            //       //  color: appProvider.isDark ? Colors.white : Colors.black54,
            //       ),
            //   backgroundColor: Colors.white,
            //   pinned: true,
            //   floating: true,
            //   expandedHeight: height * 0.27,
            //   flexibleSpace: AppBar(),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  List<QPage> pages = QPage.fromJson();
                  return Container(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      pages[index].image!,
                      fit: BoxFit.cover,
                    ),
                  );
                },

                childCount: 6, //pages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
