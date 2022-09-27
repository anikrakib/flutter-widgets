import 'package:flutter/material.dart';
import 'package:flutter_widget/widget/list_view_widget_with_sticky_header.dart';

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
    return const Scaffold(appBar: null, body: ListViewWidgetWithStickyHeader());
  }
}
