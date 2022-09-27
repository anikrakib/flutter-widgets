import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ListViewWidgetWithStickyHeader extends StatelessWidget {
  const ListViewWidgetWithStickyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 100,
            itemBuilder: (context, index) => StickyHeader(
              header: Container(
                width: double.infinity,
                height: 60,
                color: Colors.purple,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Sticky Header ${(index + 1)}',
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              content: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
          ),
        ),
      );
}
