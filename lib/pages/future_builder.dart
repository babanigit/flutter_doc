import 'package:flutter/material.dart';

class MyFutureWidget extends StatelessWidget {
  const MyFutureWidget({Key? key}) : super(key: key);

  // Simulated future function
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay
    return "Data fetched successfully!";
    // Uncomment below to simulate an error
    // throw Exception("Failed to fetch data!");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Wrap FutureBuilder in a Center for better alignment
      child: FutureBuilder<String>(
        future: fetchData(), // Call the future function
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading indicator
          } else if (snapshot.hasError) {
            return Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            );
          } else if (snapshot.hasData) {
            return Text(
              'Result: ${snapshot.data}',
              style: TextStyle(fontSize: 18),
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
