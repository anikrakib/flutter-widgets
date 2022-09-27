import 'package:flutter/material.dart';

final List _posts = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
];

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
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _posts.length,
                    itemBuilder: (context, index) {
                      return postBody(
                        80,
                        80,
                        true,
                        _posts[index],
                      );
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return postBody(250, double.infinity, false, _posts[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

Widget postBody(double _height, double _width, bool myDay, String _posts) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: _height,
        width: _width,
        decoration: myDay == true
            ? const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              )
            : const BoxDecoration(
                color: Colors.grey,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myDay == true ? "My Day" : "MyPost",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              _posts,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
