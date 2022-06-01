import 'dart:convert';

import 'package:flutter/material.dart';
import '../../screens/tab_bar/tab_screen.dart';

class ChildTabScreen extends StatefulWidget {
  final String kind;
  ChildTabScreen({Key? key, required this.kind}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<ChildTabScreen> {
  int currentIndex = 0;

  // @override
  // void didUpdateWidget(covariant ChildTabScreen oldWidget) {
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
        children: const <Widget>[
          Center(
            child: Text('one'),
          ),
          Center(
            child: Text('two'),
          ),
          Center(
            child: Text('three'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).pushNamed('/tab-bar/two/one');
            } else if (index == 1) {
              Navigator.of(context).pushNamed('/tab-bar/two/two');
            } else if (index == 2) {
              Navigator.of(context).pushNamed('/tab-bar/two/three');
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

// extension StringExt on String {
//   int toIndex() {
//     switch (this) {
//       case 'two':
//         return 1;
//       case 'three':
//         return 2;

//       case 'one':
//       default:
//         return 0;
//     }
//   }
// }
