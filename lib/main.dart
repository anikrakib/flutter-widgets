import 'package:flutter/material.dart';
import 'package:flutter_widget/fab_menu/circular_animated_fab_menu.dart';

void main() {
  runApp(const MaterialApp(
    title: "Flutter Widgets",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: CircularFabMenu());
  }
}
