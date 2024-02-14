// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import "package:calculadorapablo2k/routes/app_routes.dart";
import 'package:flutter/material.dart';
import "package:calculadorapablo2k/models/user.dart";
import "package:calculadorapablo2k/provider/users.dart";
import "package:provider/provider.dart";

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of(context);
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
      trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                },
                color: Colors.grey,
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.dangerous,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Excluir usuário",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            content: Text(
                              "Tem certeza?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  "Não",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Sim",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<Users>(context, listen: false)
                                      .remove(user);
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ));
                },
                color: Colors.red,
                icon: Icon(Icons.delete),
              )
            ],
          )),
    );
  }
}
