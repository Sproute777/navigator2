import 'dart:convert';

import 'package:flutter/material.dart';
import '../../screens/tab_bar/child_tab_bar.dart';

class TabScreen extends StatefulWidget {
  final String kind;
  final String? kind2;
  TabScreen({Key? key, required this.kind, this.kind2}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentIndex = 0;

  // @override
  // void didUpdateWidget(covariant TabScreen oldWidget) {
  //   setState(() {
  //     currentIndex = widget.kind.toIndex();
  //   });
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void didChangeDependencies() {
    setState(() {
      currentIndex = widget.kind.toIndex();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          const Center(
            child: Text('one'),
          ),
          ChildTabScreen(kind: widget.kind2 ?? 'one'),
          const Center(
            child: Text('three'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context)
                  .pushNamed('/tab-bar/test', arguments: 'one');
            } else if (index == 1) {
              Navigator.of(context)
                  .pushNamed('/tab-bar/test', arguments: 'two');
            } else if (index == 2) {
              Navigator.of(context)
                  .pushNamed('/tab-bar/test', arguments: 'three');
            }
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
  int toIndex() {
    switch (this) {
      case 'two':
        return 1;
      case 'three':
        return 2;

      case 'one':
      default:
        return 0;
    }
  }
}
