import 'package:flutter/material.dart';
import 'package:flutter_widget/bottom_nav_bar/pages/bookmark_page.dart';
import 'package:flutter_widget/bottom_nav_bar/pages/chat_page.dart';
import 'package:flutter_widget/bottom_nav_bar/pages/feed_page.dart';
import 'package:flutter_widget/bottom_nav_bar/pages/home_page.dart';
import 'package:flutter_widget/bottom_nav_bar/pages/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = const [
    HomePage(),
    FeedPage(),
    ChatPage(),
    ProfilePage(),
    BookarkPage()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Bar'),
          centerTitle: true,
        ),
        body: IndexedStack(index: currentIndex, children: screens),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.feed),
                  label: 'Feed',
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Bookmark',
                  backgroundColor: Colors.red)
            ],
          ),
        ),
      );
}
