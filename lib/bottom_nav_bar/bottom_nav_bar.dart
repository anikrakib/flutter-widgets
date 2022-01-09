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

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = const HomePage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Nav Bar with FAB button'),
          centerTitle: true,
        ),
        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomNavBarItem(0, Icons.home, 'Home'),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: bottomNavBarItem(1, Icons.feed, 'Feed'),
                  ),
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: bottomNavBarItem(2, Icons.chat, 'Chat'),
                  ),
                  bottomNavBarItem(3, Icons.person, 'profile'),
                ],
              ),
            ),
          ),
        ),
      );

  MaterialButton bottomNavBarItem(int index, IconData icon, String level) {
    return MaterialButton(
      minWidth: 60,
      onPressed: () {
        setState(() {
          currentPage = screens[index];
          currentIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            level,
            style: TextStyle(
                color: currentIndex == index ? Colors.blue : Colors.grey),
          )
        ],
      ),
    );
  }
}
