import 'package:flutter/material.dart';
import 'package:flutter_widget/widget/staggered_gridview_widget.dart';

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
    return const Scaffold(appBar: null, body: StaggeredGridViewWidget());
  }
}
