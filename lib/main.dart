import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_to_do_app/ui/screens/splashScreen.dart';
import 'package:flutter_to_do_app/ui/themes.dart';
import 'package:get_storage/get_storage.dart';

import 'db/database_helper.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/logo-removebg-preview.png');
  // InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);
  // flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.light,
      title: 'To-Do',
      debugShowCheckedModeBanner: false,
      home: const splashScreen(),
    );
  }
}