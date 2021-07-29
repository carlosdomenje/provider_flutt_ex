import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex_flutt/src/pages/home_page.dart';
import 'package:provider_ex_flutt/src/pages/second_page.dart';
import 'package:provider_ex_flutt/src/providers/user_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => UserProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        'second': (_) => SecondPage(),
      },
    );
  }
}
