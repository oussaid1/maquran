import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maquran/models/pagemodel.dart';

import '../../components.dart';
import '../../notifiers/user_conf_notifier.dart';

class PageScreen extends ConsumerStatefulWidget {
  const PageScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends ConsumerState<PageScreen>
    with TickerProviderStateMixin {
  // AnimationController? _animationController;
  //UserConf userConf = UserConf.defaultUserConf();
  int _currentPage = 1;
  List<QPage> pages = QPage.fromJson();
  late PageController _pageController;
  late UserConfPageIndex userConfPageIndex;
// load the user conf page index
  loadIndex() async {
    var box = await Hive.openBox('userconf');
    setState(() {
      _currentPage = box.get('readingIndex') ?? 1;
      _scrollToIndex(_currentPage);
    });
    print('_currentPage: $_currentPage');
  }

// save the user conf page index
  saveIndex() async {
    var box = await Hive.openBox('userconf');
    box.put('readingIndex', _currentPage);
    box.close();
    print('saved: $_currentPage');
  }

  @override
  void initState() {
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1000),
    //   animationBehavior: AnimationBehavior.preserve,
    // );
    // userConfPageIndex = UserConfPageIndex();
    // userConfPageIndex.init();
    _pageController = PageController(
      initialPage: _currentPage,
      //keepPage: true,
      // viewportFraction: 0.9,
    );
    // _currentPage = userConfPageIndex.userReadingIndex;
    loadIndex();
    print('_currentPage: $_currentPage');

    super.initState();
  }

  @override
  void dispose() {
    //  _animationController?.dispose();
    // Provider.of<UserConfNotifier>(context, listen: false)
    //     .save(userConf: userConf.copyWith(pageIndex: _currentPage));
    saveIndex();
    super.dispose();
  }

//  bool _bannerVisible = true;
  bool _isFullScreen = false;
  bool _shouldStop = false;

  void _scrollToIndex(int index) {
    // _pageController.animateTo(index.toDouble(),
    //     duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    _pageController.jumpToPage(index);
  }

// scroll to next page
  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 20000),
      curve: Curves.slowMiddle,
    );
  }

  // scroll to previous page
  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.slowMiddle,
    );
  }

  // auto play next page
  _autoPlay() async {
    nextPage();
    while (_shouldStop) {
      await Future.delayed(const Duration(milliseconds: 5000));
      _autoPlay();
    }
  }

// stop auto play
  _stopAutoPlay() {
    // _animationController?.stop();
    setState(() {
      _shouldStop = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //  _scrollToIndex(readingIndex);
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
                          _scrollToIndex(_currentPage--);
                        },
                        icon: const Icon(Icons.plus_one_outlined),
                      ),
                      IconButton(
                          onPressed: _autoPlay,
                          icon: const Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.exposure_minus_1_outlined)),
                      IconButton(
                        onPressed: nextPage,
                        icon: const Icon(Icons.stop),
                      ),
                      const SizedBox(height: 60),
                      IconButton(
                        highlightColor: Colors.red,
                        onPressed: _stopAutoPlay,
                        icon: const Icon(Icons.save),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView.builder(

          //  physics: const NeverScrollableScrollPhysics(),
          // onPageChanged: (index) {
          //   setState(() {
          //     _currentPage = index;
          //   });
          //   // ref
          //   //     .read(userConfNotifierProvider)
          //   //     .save(userConf: userConf.copyWith(pageIndex: index));
          // },
          allowImplicitScrolling: true,
          controller: _pageController,
          itemCount: pages.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            _currentPage = index;
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
                // if (!_bannerVisible) {
                //   ScaffoldMessenger.of(context).showMaterialBanner(
                //     MaterialBanner(
                //       animation: _animationController,
                //       // backgroundColor: Colors.blue,
                //       onVisible: () {
                //         setState(() {
                //           _bannerVisible = true;
                //         });
                //       },
                //       leading: const Icon(Icons.info),
                //       content: Text('الصفحة ${_currentPage + 1}'),
                //       actions: <Widget>[
                //         MaterialButton(
                //           child: const Text('حسنا'),
                //           onPressed: () {},
                //         ),
                //       ],
                //     ),
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

                //   setState(() {
                //     _bannerVisible = false;
                //   });
                // }
                Scaffold.of(context).openEndDrawer();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('الصفحة ${_currentPage + 1}'),
                //     duration: const Duration(seconds: 2),
                //   ),
                // );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: width,
                      height: height,
                      child: Image.asset(
                        pages[_currentPage].image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  _buildPageSeparator(width, height, _currentPage),
                ],
              ),
            );
          }),
    );
  }

  Container _buildPageSeparator(double height, double width, int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: height * 0.12,
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
                  color: const Color.fromARGB(141, 148, 148, 148),
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
                  color: const Color.fromARGB(141, 148, 148, 148),
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
