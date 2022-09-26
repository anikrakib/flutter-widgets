import 'package:flutter/material.dart';

class RowAndColumnWidget extends StatelessWidget {
  const RowAndColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('Row & Column'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: element(Colors.red, 8.0),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: element(Colors.yellow, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: element(Colors.lightGreen, 0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: element(Colors.lightGreen, 0),
                              ),
                              Expanded(
                                flex: 2,
                                child: element(Colors.yellow, 8.0),
                              ),
                              Expanded(
                                flex: 8,
                                child: element(Colors.yellow, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left:  8.0, bottom: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: smallBox(Colors.black),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallBox(Colors.white),
                                    smallBox(Colors.white),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget element(Color boxColor, double paddingSize) => Padding(
      padding: EdgeInsets.only(bottom: paddingSize, top: paddingSize),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: boxColor,
        ),
      ),
    );

Widget smallBox(Color boxColor) => Container(
  width: 100,
  decoration: BoxDecoration(
    color: boxColor,
    borderRadius: BorderRadius.circular(10),
  ),
);