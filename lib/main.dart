import 'package:flutter/material.dart';
import 'screens/screen4.dart';
import 'screens/screen_form.dart';
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
      // restorationScopeId: 'root',
      navigatorObservers: [NavigationHistoryObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/tab-bar/one',
      // onGenerateInitialRoutes: () => '/tab-bar/one',
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const Screen1());
          case '/two':
            return MaterialPageRoute(builder: (_) => const Screen2());
          case '/two/three':
            return MaterialPageRoute(builder: (_) => const Screen3());
          case '/two/four':
            return MaterialPageRoute(builder: (_) => const Screen3());
          case '/tab-bar/one':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'one',
                    ));

          case '/tab-bar/two':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'two',
                    ));

          case '/tab-bar/two/one':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'two/one',
                    ));

          case '/tab-bar/two/two':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'two/two',
                    ));

          case '/tab-bar/two/three':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'two/three',
                    ));

          case '/tab-bar/three':
            return MaterialPageRoute(
                builder: (_) => TabScreen(
                      kind: 'three',
                    ));
        }
      },
      //   routes: {
      //     '/form': (context) => const ScreenForm(),
      //     '/': (context) => const Screen1(),
      //     '/two': (context) => const Screen2(),
      //     '/two/three': (context) => const Screen3(),
      //     '/two/four': (context) => const Screen4(),
      //     '/tab-bar/one': (context) => TabScreen(
      //           kind: ValueNotifier<String>('one'),
      //         ),
      //     '/tab-bar/two': (context) =>
      //         TabScreen(kind: ValueNotifier<String>('two')),
      //     // '/tab-bar/test': (context) => TabScreen(
      //     //     kind: (ModalRoute.of(context)?.settings.arguments as String?) ??
      //     //         'one'),
      //     '/tab-bar/two/one': (context) => TabScreen(
      //           kind: ValueNotifier<String>('two/one'),
      //         ),
      //     '/tab-bar/two/two': (context) => TabScreen(
      //           kind: ValueNotifier<String>('two/two'),
      //         ),
      //     '/tab-bar/two/three': (context) => TabScreen(
      //           kind: ValueNotifier<String>('two/three'),
      //         ),
      //     '/tab-bar/three': (context) =>
      //         TabScreen(kind: ValueNotifier<String>('three')),
      //   },
    );
  }
}
