import 'dart:convert';

import 'package:flutter/material.dart';
import '../../screens/tab_bar/child_tab_bar.dart';

class TabScreen extends StatefulWidget {
  final String kind;

  const TabScreen({Key? key, required this.kind}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final ValueNotifier<int> index = ValueNotifier<int>(0);
  int currentIndex = 0;
  int? subIndex;

  final pageController = PageController();

  void onTap(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients) {
        pageController.jumpToPage(index);
      }
    });
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    final tabsIndex = widget.kind.toIndex();
    currentIndex = tabsIndex[0];
    onTap(currentIndex);

    if (tabsIndex.length == 2) {
      subIndex = tabsIndex[1];
    } else {
      subIndex = null;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          const Center(
            child: Text('one'),
          ),
          ChildTabScreen(
            index: subIndex,
          ),
          const Center(
            child: Text('three'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            onTap(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'one'),
            BottomNavigationBarItem(icon: Icon(Icons.bus_alert), label: 'two'),
            BottomNavigationBarItem(icon: Icon(Icons.air), label: 'thee'),
          ]),
    );
  }
}

extension StringExt on String {
  List<int> toIndex() {
    switch (this) {
      case 'two':
        return [1];
      case 'two/one':
        return [1, 0];
      case 'two/two':
        return [1, 1];
      case 'two/three':
        return [1, 2];
      case 'three':
        return [2];

      case 'one':
      default:
        return [0];
    }
  }
}
