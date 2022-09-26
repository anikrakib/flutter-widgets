import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extended Widget'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 20,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowContainer(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: columnContainer(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget rowContainer() => Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.amber,
            child: const Center(child: Text('1')),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.red,
            child: const Center(child: Text('2')),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.blue,
            child: const Center(child: Text('3')),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.black,
            child: const Center(
                child: Text(
              '4',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );

Widget columnContainer() => Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.amber,
            child: const Center(child: Text('1')),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: const Center(child: Text('2')),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: const Center(child: Text('3')),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black,
            child: const Center(
                child: Text(
              '4',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
