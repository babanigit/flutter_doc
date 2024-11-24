import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFutureWidget extends StatelessWidget {
  const MyFutureWidget({Key? key}) : super(key: key);

  // Simulated future function
  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['title'];
    } else {
      throw Exception('Failed to load data');
    }
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
