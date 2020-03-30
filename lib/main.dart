import 'package:custom_clip_path/figmas_logo.dart';
import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FigmasLogo(),
    );
  }
}

class CurvesPath extends StatelessWidget {
  const CurvesPath({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Home3(),
            Home2(),
            Home(),
            Center(
              child: Text(
                "FIGMA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  fontSize: 48,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends CustomRectWithPainter {
  @override
  Widget get child => Container(
        color: Colors.red,
      );

  @override
  Shadow get shadow => Shadow(blurRadius: 100, color: Colors.black);

  @override
  CustomClipper<Path> clipper() => CustomPath1();
}

class Home2 extends CustomRectWithPainter {
  @override
  Widget get child => Container(
        color: Colors.blue,
      );

  @override
  CustomClipper<Path> clipper() => CustomPath2();

  @override
  Shadow get shadow => Shadow(blurRadius: 100, color: Colors.black);
}

class Home3 extends CustomRectWithPainter {
  @override
  Widget get child => Container(
        color: Colors.green,
      );

  @override
  CustomClipper<Path> clipper() => CustomPath3();

  @override
  Shadow get shadow => Shadow(
        blurRadius: 10,
        color: Colors.black,
      );
}

class CustomPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
        size.width * .5, size.height * .50, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * .50);
    path.quadraticBezierTo(
        size.width * .5, size.height * .75, size.width, size.height * .50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomPath3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * .75);
    path.quadraticBezierTo(
        size.width * .5, size.height, size.width, size.height * .75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

@immutable
abstract class CustomRectWithPainter extends StatelessWidget {
  Shadow get shadow;
  CustomClipper<Path> clipper();
  Widget get child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _InsidePainter(shadow: shadow, path: clipper()),
      child: ClipPath(
        child: child,
        clipper: clipper(),
      ),
    );
  }
}

class _InsidePainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> path;

  _InsidePainter({
    this.shadow,
    this.path,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = shadow.toPaint();
    final resolvedClipper = path.getClip(size);
    canvas.drawPath(resolvedClipper, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
