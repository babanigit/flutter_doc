import 'package:flutter/material.dart';

class MaterialappPage extends StatelessWidget {
  const MaterialappPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Practice Page 1'),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to another page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const SecondPage(),
            //   ),
            // );
          },
          child: const Text('Go to Second Page'),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.green,
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
          ],
          onTap: (int indexOfItem) {}
        ),


    );
  }
}
