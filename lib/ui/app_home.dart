import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';
import '../utils/size_config.dart';

class AppHome extends StatefulWidget {
  final int index;
  final Widget? view;
  const AppHome({
    Key? key,
    this.index = 0,
    this.view,
  }) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

int pageSelectedIndex = 0;
PageController? pageController;

class _AppHomeState extends State<AppHome> {
  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: widget.index);

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _loadView();
    });
  }

  void _loadView() {
    setStateIfMounted(() {
      pageSelectedIndex = widget.index;
    });

    if (widget.view != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.view!,
        ),
      );
    }
  }

  List<Widget> tabs = [
    const HomeScreen(),
    Container(),
    const CartScreen(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: PageView(
        children: tabs,
        controller: pageController,
        onPageChanged: (i) {
          setState(() {
            pageSelectedIndex = i;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: SizedBox(
        height: SizeConfig.height(64),
        child: SalomonBottomBar(
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 25,
                  height: 25,
                ),
                title: const Text('Home'),
                selectedColor: Colors.orange,
                activeIcon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 25,
                  height: 25,
                  color: Colors.orange,
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/category.svg',
                  width: 25,
                  height: 25,
                ),
                title: const Text('Category'),
                selectedColor: Colors.orange,
                activeIcon: SvgPicture.asset(
                  'assets/icons/category.svg',
                  width: 25,
                  height: 25,
                  color: Colors.orange,
                ),
              ),
              SalomonBottomBarItem(
                icon: Image.asset(
                  'assets/icons/bag.png',
                  width: 25,
                  height: 25,
                ),
                title: const Text('Cart'),
                selectedColor: Colors.orange,
                activeIcon: Image.asset(
                  'assets/icons/bag.png',
                  width: 25,
                  height: 25,
                  color: Colors.orange,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
                selectedColor: Colors.orange,
              ),
            ],
            currentIndex: pageSelectedIndex,
            onTap: (int i) {
              setState(() {
                pageSelectedIndex = i;
              });
              pageController!.animateToPage(i,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linearToEaseOut);
            }),
      ),
    );
  }
}
