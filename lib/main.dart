import 'package:flutter/material.dart';
import 'package:flutter_widget/appBar/appbar_with_tab_layout.dart';
import 'package:flutter_widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_widget/fab_menu/circular_animated_fab_menu.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Widgets",
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: BottomNavBar());
  }
}
