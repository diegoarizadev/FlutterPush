//29:1A:8E:1B:7D:E6:91:3C:5E:6B:AC:6E:97:EC:E7:86:C4:5C:37:91
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushServiceCustom {
  static FirebaseMessaging messaging = FirebaseMessaging
      .instance; //obtiene la instancia del proyecto e informacion del mismo.

  static String?
      token; //? quie3re decir opcional y hace referencia al token par ael envio de mensajes.

  static StreamController<String> _messageStreamController = new StreamController
      .broadcast(); //Este Stream nunca se va a cerrar debido a que debe escchar los mensajes push. El objectivo es transmitir informacion

//Exponer el Stream para la suscripcion y escucha.
  static Stream<String> get messageStreamController =>
      _messageStreamController.stream;

  static Future initializeApp() async {
//Push Notifications.
    await Firebase.initializeApp(); //Inixializa todos los componentes.
    token = await FirebaseMessaging.instance.getToken(); //Se obtiene el token
    print('PushServiceCustom - token : $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(
        _onbackgroundHandler); //Pasa la refenrencia de la función
    FirebaseMessaging.onMessage
        .listen(_onMessageHandler); //Cuando la Aplicacion esta abierta
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageHandlerOpenApp);

//Local Notifications.
  }

  //Cuando la aplicación está abierta, pero en segundo plano (minimizada). Esto suele ocurrir cuando el usuario ha presionado el botón "Inicio" en el dispositivo, ha cambiado a otra aplicación a través del conmutador de aplicaciones o tiene la aplicación abierta en una pestaña diferente (web).
  static Future _onbackgroundHandler(RemoteMessage message) async {
    print('_onbackgroundHandler - message.messageId   : ${message.messageId}');
    print(
        '_onbackgroundHandler - message.messageType : ${message.messageType}');

    //Añadir informacion al Stream.
    _messageStreamController.sink.add(message.data['product'] ??
        'No data'); //Espera un String y le enviamos el titulo del mensaje
  }

  //Cuando la aplicación está abierta, a la vista y en uso.
  static Future _onMessageHandler(RemoteMessage message) async {
    print('_onMessageHandler - message.messageId   : ${message.messageId}');
    print('_onMessageHandler - message.messageType : ${message.messageType}');
    print(
        '_onMessageHandler - message.messageType : ${message.data}'); //message.data son los parametros adicionales del mensaje push
    _messageStreamController.sink.add(message.data['product'] ?? 'No data');
  }

  //Cuando el dispositivo está bloqueado o la aplicación no se está ejecutando. El usuario puede terminar una aplicación "deslizándola hacia afuera" a través de la interfaz de usuario del conmutador de aplicaciones en el dispositivo o cerrando una pestaña (web).
  static Future _onMessageHandlerOpenApp(RemoteMessage message) async {
    print(
        '_onMessageHandlerOpenApp - message.messageId   : ${message.messageId}');
    print(
        '_onMessageHandlerOpenApp - message.messageType : ${message.messageType}');
    _messageStreamController.sink.add(message.data['product'] ?? 'No data');

    print(
        '_onMessageHandlerOpenApp - message.messageType : ${message.data}'); //message.data son los parametros adicionales del mensaje push
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
