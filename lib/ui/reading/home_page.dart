import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maquran/models/pagemodel.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      animationBehavior: AnimationBehavior.preserve,
    );
    super.initState();
  }

  bool _bannerVisible = true;
  bool _isFullScreen = false;

  void _scrollToIndex(double index) {
    _scrollController.animateTo(index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  final _scrollController = ScrollController();
  late int _currentPage;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: SizedBox(
        width: 60,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          for (int i = 0; i < 10; i++) {
                            _scrollToIndex(_currentPage + 1);
                          }
                        },
                        icon: const Icon(Icons.plus_one_outlined),
                      ),
                      IconButton(
                          onPressed: () {
                            for (int i = 0; i < 10; i++) {
                              _scrollToIndex(_currentPage - 1);
                            }
                          },
                          icon: const Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.exposure_minus_1_outlined)),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.stop),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        controller: _scrollController,
        itemBuilder: (context, index) {
          _currentPage = index;
          List<QPage> pages = QPage.fromJson();
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                _isFullScreen = !_isFullScreen;
              });
              if (_isFullScreen) {
                SystemChrome.setEnabledSystemUIMode(
                    SystemUiMode.immersiveSticky);
              } else {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
              }
            },
            onTap: () {
              if (!_bannerVisible) {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    animation: _animationController,
                    // backgroundColor: Colors.blue,
                    onVisible: () {
                      setState(() {
                        _bannerVisible = true;
                      });
                    },
                    leading: const Icon(Icons.info),
                    content: Text('الصفحة ${index + 1}'),
                    actions: <Widget>[
                      MaterialButton(
                        child: const Text('حسنا'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

                setState(() {
                  _bannerVisible = false;
                });
              }
              Scaffold.of(context).openEndDrawer();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('الصفحة ${index + 1}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              width: width,
              height: height,
              child: Image.asset(
                pages[index].image!,
                fit: BoxFit.fill,
              ),
            ),
          );
        },

        separatorBuilder: (ctx, index) {
          // return Container(
          //   height: 1,
          //   color: Colors.black,
          // );
          return _buildPageSeparator(height, width, index);
        },
        itemCount: QPage.fromJson().length, //pages.length,
      ),
    );
  }

  Container _buildPageSeparator(double height, double width, int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: height * 0.06,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
          top: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(141, 148, 148, 148),
                  backgroundBlendMode: BlendMode.darken,
                ),
              ),
              Text(
                'الحزب الثاني',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Text(
            'سورة يس',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Row(
            children: [
              Text(
                'الجزء ${index + 1}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(141, 148, 148, 148),
                  backgroundBlendMode: BlendMode.darken,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
