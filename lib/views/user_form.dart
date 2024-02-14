// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers

import 'package:calculadorapablo2k/models/user.dart';
import 'package:calculadorapablo2k/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    } else {
      _loadFormData(User(id: "", name: "", email: "", avatarUrl: ""));
    }
  }

  void _loadFormData(User user) {
    setState(() {
      _formData["id"] = user.id;
      _formData["name"] = user.name;
      _formData["email"] = user.email;
      _formData["avatarUrl"] = user.avatarUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to UserForm"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData["id"] ?? "",
                  name: _formData["name"] ?? "",
                  email: _formData["email"] ?? "",
                  avatarUrl: _formData["avatarUrl"] ?? "",
                ));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData["name"],
                decoration: InputDecoration(labelText: "Nome:"),
                validator: (value) {
                  RegExp regex = RegExp(r'\d');
                  if (regex.hasMatch(value!) || value == "") {
                    return "Ocorreu um erro ao inserir seu nome";
                  }
                },
                onSaved: (value) => _formData["name"] = value!,
              ),
              TextFormField(
                initialValue: _formData["email"],
                decoration: InputDecoration(labelText: "Email:"),
                validator: (value) {
                  if (value == "") {
                    return "Ocorreu um erro ao inserir seu email";
                  }
                },
                onSaved: (value) => _formData["email"] = value!,
              ),
              TextFormField(
                initialValue: _formData["avatarUrl"],
                decoration: InputDecoration(labelText: "URL do Avatar:"),
                validator: (value) {
                  if (value == "") {
                    return "Ocorreu um erro ao inserir seu email";
                  }
                },
                onSaved: (value) {
                  _formData["avatarUrl"] = value!;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
