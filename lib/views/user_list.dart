// ignore_for_file: prefer_const_constructors
import 'package:calculadorapablo2k/routes/app_routes.dart';
import 'package:provider/provider.dart';
import "package:calculadorapablo2k/provider/users.dart";
import 'package:flutter/material.dart';
import "package:calculadorapablo2k/components/user_tile.dart";

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de usuarios"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: users.count,
            itemBuilder: (ctx, i) => UserTile(users.byIndex(i))));
  }
}
