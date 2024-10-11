import 'package:flutter/material.dart';
import 'package:projeto_ajudar/features/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Função para manipulação de mensagens em segundo plano
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Manipulação da mensagem em background
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //garante que o binding do Flutter esteja inicializado
  await Firebase.initializeApp(); //inicializa o Firebase antes de usar qualquer funcionalidade relacionada
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); //exibe no console o ID da mensagem recebida em segundo plano

  runApp(MyApp()); //Inicializa o aplicativo
}

//define a classe que representa o aplicativo principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajude App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const SplashPage(), //define a página inicial do aplicativo como SplashPage
    );
  }
}
