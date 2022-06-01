import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationHistoryObserver historyObserver =
        NavigationHistoryObserver();
    final historyCount = historyObserver.history.length;
    final poppedCount = historyObserver.poppedRoutes.length;
    final history = historyObserver.history;
    final popped = historyObserver.poppedRoutes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Screen Three",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            final navigator = Navigator.of(context);
            final canPop = navigator.canPop();
            if (canPop) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamed(context, '/two');
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('can not pop')));
            }
          },
          child: const Center(child: Text("pop")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('history count $historyCount'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('popped count $poppedCount'),
        ),
        Expanded(
          child: ListView(children: [
            ...history.map(
              (p0) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('--h-- name ${p0.settings.name}'),
              ),
            )
          ]),
        ),
        Expanded(
          child: ListView(children: [
            ...popped.map(
              (p0) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('--p-- name ${p0.settings.name}'),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
