//29:1A:8E:1B:7D:E6:91:3C:5E:6B:AC:6E:97:EC:E7:86:C4:5C:37:91
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushServiceCustom {
  static FirebaseMessaging messaginq = FirebaseMessaging
      .instance; //obtiene la instancia del proyecto e informacion del mismo.

  static String?
      token; //? quie3re decir opcional y hace referencia al token par ael envio de mensajes.

  static Future initializeApp() async {
//Push Notifications.
    await Firebase.initializeApp(); //Inixializa todos los componentes.
    token = await FirebaseMessaging.instance.getToken(); //Se obtiene el token
    print('PushServiceCustom - token : $token');

//Local Notifications.
  }
}
