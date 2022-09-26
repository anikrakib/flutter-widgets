import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('List View'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                      postBody(80, 80,true),
                    ],
                  ),
                ),
                Column(
                  children: [
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                    postBody(200, double.infinity,false),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}

Widget postBody(double _height, double _width, bool myday) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: _height,
        width: _width,
        decoration: myday == true
            ? const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              )
            : const BoxDecoration(
                color: Colors.grey,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "My Post",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              "1",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
