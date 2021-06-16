import 'package:flutter/material.dart';
import 'package:push/pages/home.dart';
import 'package:push/pages/message.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones Push',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(), //(_)BuildContext.
        'message': (_) => MessageScreen(), //(_)BuildContext.
      },
    );
  }
}
