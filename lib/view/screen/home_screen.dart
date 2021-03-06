import 'file:///C:/Users/syoki/AndroidStudioProjects/communitygetandpost/lib/view/page/project_search_page.dart';
import 'file:///C:/Users/syoki/AndroidStudioProjects/communitygetandpost/lib/view/page/my_page.dart';
import 'package:communitygetandpost/view/page/todo_list_page.dart';
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
    _pages = [MyPage(), ProjectSearchPage(), ToDoListPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("HOME")),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("SEARCH")),
            BottomNavigationBarItem(icon: Icon(Icons.today_outlined), title: Text("TODO"))
      ]),
      body: _pages[_currentIndex],

    );
  }
}
