import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/home/home_list_screen.dart';
import 'package:mobile_ticket_pay/more_list/more_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _duration = const Duration(microseconds: 10);
  static const _curve = Curves.ease;

  int _selectedPageIndex = 0;
  PageController _pageController = PageController();

  void _onPageSelected(int index) {
    _pageController.animateToPage(index, duration: _duration, curve: _curve);

    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = <Widget>[
    HomeListScreen(),
    MoreListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Ticket Pay"),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
          itemCount: _pages.length,
          controller: _pageController,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white30,
        onTap: _onPageSelected,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text("More"),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
