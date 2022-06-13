import 'package:flutter/material.dart';

class GlobalMethod {
  static void showErrorDialog(
      {@required String error, @required BuildContext ctx}) {
    showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/128/1252/1252006.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: const Text(

                    'Problem in SignUp',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            content: Text(
              '$error',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }
}