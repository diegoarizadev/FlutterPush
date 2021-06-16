import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones Push'),
      ),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
