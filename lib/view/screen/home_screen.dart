import 'package:communitygetandpost/view/community_list_page.dart';
import 'package:communitygetandpost/view/my_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [MyPage(), CommunityListPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("HOME")),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("SEARCH"))
      ]),
      body: _pages[_currentIndex],

    );
  }
}
