import 'package:flutter/material.dart';

class FigmasLogo extends StatelessWidget {
  const FigmasLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFf24e1e),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                bottomLeft: Radius.circular(999),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFff7262),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(999),
                bottomRight: Radius.circular(999),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFa259ff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                bottomLeft: Radius.circular(999),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF1abcfe),
              borderRadius: BorderRadius.all(
                Radius.circular(999),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0acf83),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(999),
                bottomLeft: Radius.circular(999),
                bottomRight: Radius.circular(999),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "FIGMA",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontStyle: FontStyle.italic,
                letterSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
