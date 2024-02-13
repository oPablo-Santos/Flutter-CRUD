// ignore_for_file: prefer_const_constructors

import 'package:calculadorapablo2k/provider/users.dart';
import 'package:calculadorapablo2k/routes/app_routes.dart';
import 'package:calculadorapablo2k/views/user_form.dart';
import 'package:calculadorapablo2k/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Testagens',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (context) => UserList(),
          AppRoutes.USER_FORM: (context) => UserForm()
        },
      ),
    );
  }
}
