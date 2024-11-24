import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsyncAwaitExample extends StatelessWidget {
  const AsyncAwaitExample({Key? key}) : super(key: key);

  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['title'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async/Await Example')),
      body: FutureBuilder<String>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(child: Text('Title: ${snapshot.data}'));
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
