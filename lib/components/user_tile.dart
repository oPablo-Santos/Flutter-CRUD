// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import "package:calculadorapablo2k/models/user.dart";

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
            radius: 25.0,
          );
    return ListTile(
      tileColor: Colors.grey[200],
      leading: avatar,
      title: Text(
        user.name,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
