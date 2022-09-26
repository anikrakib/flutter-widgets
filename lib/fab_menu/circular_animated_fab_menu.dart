import 'dart:math';

import 'package:flutter/material.dart';

const double buttonSize = 50;
const double pi = 3.1416;
late AnimationController animationController;

class CircularFabMenu extends StatefulWidget {
  const CircularFabMenu({Key? key}) : super(key: key);

  @override
  _CircularFabMenuState createState() => _CircularFabMenuState();
}

class _CircularFabMenuState extends State<CircularFabMenu>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Custom Animation FAB Menu'),
          centerTitle: true,
        ),
        floatingActionButton: const CircularFabWidgets(),
        body: SafeArea(
          child: Container(),
        ),
      );
}

class CircularFabWidgets extends StatefulWidget {
  const CircularFabWidgets({Key? key}) : super(key: key);

  @override
  _CircularFabWidgetsState createState() => _CircularFabWidgetsState();
}

class _CircularFabWidgetsState extends State<CircularFabWidgets> {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controler: animationController),
      children: [
        Icons.mail,
        Icons.call,
        Icons.notifications,
        Icons.sms,
        Icons.menu,
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) => SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          elevation: 10,
          splashColor: Colors.black,
          onPressed: () {
            if (animationController.status == AnimationStatus.completed) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controler;

  FlowMenuDelegate({required this.controler}) : super(repaint: controler);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    final n = context.childCount;

    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      setValue(value) => isLastItem ? 0.0 : value;

      final radius = 120 * (controler.value);
      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));

      context.paintChild(i,
          transform: Matrix4.identity()
            ..translate(x, y, 0)
            ..translate(buttonSize / 2, buttonSize / 2)
            ..rotateZ(isLastItem ? 0.0 : 180 * (1 - controler.value) * pi / 180)
            ..scale(isLastItem ? 1.0 : max(controler.value, 0.5))
            ..translate(-buttonSize / 2, -buttonSize / 2));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    throw UnimplementedError();
  }
}
