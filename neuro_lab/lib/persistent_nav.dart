import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_lab/my_drawer.dart';
import 'package:neuro_lab/src/save_recording_feature/record_page.dart';
import 'package:neuro_lab/src/save_recording_feature/record_list_view.dart';
import 'package:neuro_lab/src/settings/settings_view.dart';

class PersistentTabScreen extends StatefulWidget {
  const PersistentTabScreen({super.key});

  static const routeName = '/';
  @override
  State<PersistentTabScreen> createState() => _PersistentTabScreenState();
}

class _PersistentTabScreenState extends State<PersistentTabScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [MainPage(), const RecordListViewPage()];
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track your sleep'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade900, Colors.indigo.shade700],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: const MyDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _buildScreens(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        selectedItemColor: CupertinoColors.systemIndigo,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: "Record",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: "List",
          ),
        ],
      ),
    );
  }
}
