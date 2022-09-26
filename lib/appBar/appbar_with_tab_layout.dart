import 'package:flutter/material.dart';

class AppbarWithTabLayout extends StatelessWidget {
  const AppbarWithTabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text('App Bar'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 20,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: gradientBackground()),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
              //indicatorPadding: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(5),
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              //automaticIndicatorColorAdjustment: false,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.feed),
                  text: 'Feed',
                ),
                Tab(
                  icon: Icon(Icons.face),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'Settings',
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            buildPage('Home Page'),
            buildPage('Feed Page'),
            buildPage('Profile Page'),
            buildPage('Settings Page'),
          ],
        ),
      ),
    );
  }

  LinearGradient gradientBackground() {
    return const LinearGradient(
      colors: [Colors.purple, Colors.red],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
