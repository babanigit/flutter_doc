import 'package:flutter/material.dart';
import 'package:flutter_doc/pages/drawer.dart';
import 'package:flutter_doc/pages/future_builder.dart';
import 'package:flutter_doc/pages/setting.dart';

class App extends StatefulWidget {
  final VoidCallback toggleTheme; // Function to toggle theme

  const App({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0; // Track the selected page index

  // List of pages to display
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize pages with the toggle function for SettingsPage
    _pages = [
      const HomePage(),
      const SearchPage(),
      const ProfilePage(),
      Setting(toggleTheme: widget.toggleTheme), // Pass toggleTheme here
      const AppDrawer(),
      const MyFutureWidget()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // Show the current page
        children: _pages, // Pages to switch between
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected page index
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Drawer",
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "futureWidget",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

// Define each page as a separate widget
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
