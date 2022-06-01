import 'package:flutter/material.dart';
import 'screens/screen4.dart';
import 'screens/tab_bar/tab_screen.dart';
import '/screens/screen1.dart';
import '/screens/screen2.dart';
import '/screens/screen3.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [NavigationHistoryObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/tab-bar/test',
      routes: {
        '/': (context) => const Screen1(),
        '/two': (context) => const Screen2(),
        '/two/three': (context) => const Screen3(),
        '/two/four': (context) => const Screen4(),
        '/tab-bar/one': (context) => TabScreen(
              kind: 'one',
            ),
        '/tab-bar/two': (context) => TabScreen(kind: 'two'),
        '/tab-bar/test': (context) => TabScreen(
            kind: (ModalRoute.of(context)?.settings.arguments as String?) ??
                'one'),
        '/tab-bar/two/one': (context) => TabScreen(kind: 'two', kind2: 'one'),
        '/tab-bar/two/two': (context) => TabScreen(kind: 'two', kind2: 'two'),
        '/tab-bar/two/three': (context) =>
            TabScreen(kind: 'two', kind2: 'three'),
        '/tab-bar/three': (context) => TabScreen(kind: 'three'),
      },
    );
  }
}
