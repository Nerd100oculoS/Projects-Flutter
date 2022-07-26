import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String numbers;
  Display(this.numbers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8.0),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              numbers,
              minFontSize: 30,
              maxFontSize: 60,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                  fontSize: 60,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
