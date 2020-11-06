import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexmp_app/providers/settingsProvider.dart';
import 'package:providerexmp_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((BuildContext context) => SettingsProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepPurple,
        ),
        home: Home(),
      ),
    );
  }
}