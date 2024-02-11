import 'package:flutter/material.dart';
import "package:calculadorapablo2k/data/dummy_users.dart";
import "package:calculadorapablo2k/components/user_tile.dart";

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    const users = {...dummyUsers};
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de usuarios"),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i))));
  }
}
