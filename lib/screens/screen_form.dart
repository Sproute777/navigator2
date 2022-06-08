import 'package:flutter/material.dart';

class ScreenForm extends StatelessWidget {
  const ScreenForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Center(
              child: Padding(
            padding: EdgeInsets.all(32.0),
            child: TextField(
              decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.red,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    )),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
