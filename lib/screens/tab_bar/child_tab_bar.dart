import 'package:flutter/material.dart';

class ChildTabScreen extends StatefulWidget {
  final int? index;
  const ChildTabScreen({Key? key, required this.index}) : super(key: key);

  @override
  ChildScreenState createState() => ChildScreenState();
}

class ChildScreenState extends State<ChildTabScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    if (widget.index != null) {
      setState(() {
        _currentIndex = widget.index!;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: const <Widget>[
        Center(
          child: Text('one'),
        ),
        Center(
          child: Text('two'),
        ),
        Center(
          child: Text('three'),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'one'),
            BottomNavigationBarItem(icon: Icon(Icons.bus_alert), label: 'two'),
            BottomNavigationBarItem(icon: Icon(Icons.air), label: 'thee'),
          ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
