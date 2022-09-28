import 'package:flutter/material.dart';

const gridViewLength = 20;

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GridView"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: const Color(0xFF343435),
            child: Column(
              children: [
                buildSizedBox('GridView With Count'),
                Container(
                  child: gridViewWithCount(),
                ),
                buildSizedBox('GridView With Builder'),
                Container(
                  child: gridViewWithBuilder(),
                ),
                buildSizedBox('GridView With Extent'),
                Container(
                  child: gridViewWithExtent(),
                ),
              ],
            ),
          ),
        ));
  }

  Padding gridViewWithExtent() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.extent(
          maxCrossAxisExtent: 400,
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (int i = 0; i < gridViewLength; i++) buildImageCard(i)
          ],
        ));
  }

  Padding gridViewWithCount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 4,
        // If it is true, it will reverse the list in the opposite direction along the main axis.
        //reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        //crossAxisSpacing: 4.0,
        shrinkWrap: true,
        mainAxisSpacing: 4.0,
        children: List.generate(gridViewLength, (index) {
          return Center(
            child: SizedBox(
              height: 120,
              width: 200,
              child: buildImageCard(index),
            ),
          );
        }),
      ),
    );
  }

  Padding gridViewWithBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: gridViewLength,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => buildImageCard(index),
      ),
    );
  }

  Card buildImageCard(index) => Card(
        color: Colors.brown,
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
          ),
        ),
      );

  SizedBox buildSizedBox(String value) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
