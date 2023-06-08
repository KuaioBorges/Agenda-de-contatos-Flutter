import 'dart:js';

import 'package:agenda_de_contatos/screens/add_contact/add_contact.dart';
import 'package:agenda_de_contatos/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Agenda de contatos",
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/add": (context) => AddContact(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.green,
          secondary: Colors.amber,
        ),
      ),
    ),
  );
}
