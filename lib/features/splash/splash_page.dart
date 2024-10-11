import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projeto_ajudar/features/onboarding/onboarding_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState(); // Cria o estado para a página
}

class _SplashPageState extends State<SplashPage> {
  // Instância do plugin de notificações locais
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging(); //Configura o Firebase Messaging
    _initializeLocalNotifications(); //Inicializa as notificações locais

    // Timer para esperar 5 segundos e navegar para a OnboardingPage
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  // Inicializa as configurações das notificações locais
  void _initializeLocalNotifications() async {
    // Configurações para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configurações gerais
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    // Inicializa as configurações das notificações locais
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Criar canal de notificação
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'fcm_default_channel', // ID do canal
      'Notificações', // Nome do canal
      description: 'Canal para receber notificações do Firebase',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Cria o canal no Android
  void _setupFirebaseMessaging() {
    // Solicitar permissão (se necessário)
    FirebaseMessaging.instance.requestPermission();

    // Obter o token do dispositivo
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });

    // Listener para mensagens recebidas quando o aplicativo está em primeiro plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title} - ${message.notification?.body}");
      _showNotification(message.notification); // Exibir notificação
    });

    // Listener para mensagens recebidas em segundo plano
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Função para tratar mensagens em segundo plano
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  // Exibe a notificação local quando uma mensagem é recebida
  Future<void> _showNotification(RemoteNotification? notification) async {
    if (notification != null) { // Verifica se a notificação não é nula
      // Configura detalhes da notificação para Android
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'fcm_default_channel',
        'Notificações',

        importance: Importance.max, //Define a importância da notificação
        priority: Priority.high, //Define a prioridade da notificação
        showWhen: false,//Define se a notificação deve mostrar a data/hora
      );

      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

      // Exibe a notificação local
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: 'item x',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.yellow,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/Ajude fundo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            // Indicador de carregamento (loading)
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}