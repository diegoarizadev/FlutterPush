import 'package:flutter/material.dart';
import 'package:push/pages/home.dart';
import 'package:push/pages/message.dart';
import 'package:push/services/push_services.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //asegura que por lo menos el context esta listo antes de continuar el resto de instrucciones.
  await PushServiceCustom.initializeApp();

  runApp(MyApp());
}

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
