import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final VoidCallback toggleTheme;

  const Setting({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Settings Page',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Light Mode'),
              Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  toggleTheme(); // Call the toggleTheme function
                },
              ),
              const Text('Dark Mode'),
            ],
          ),
          
        ],
      ),
    );
  }
}
