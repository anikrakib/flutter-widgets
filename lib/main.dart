import 'package:flutter/material.dart';
import 'package:flutter_widget/appBar/appbar_with_tab_layout.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Widgets",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: AppbarWithTabLayout());
  }
}
