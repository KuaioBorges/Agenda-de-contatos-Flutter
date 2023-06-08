import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/screens/details/edit_contact/edit_contact.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Contact contact;
  Details({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          contact.name,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              contact.photo,
              width: 400,
            ),
            Padding(
              padding: EdgeInsets.all(
                16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contact.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    Text(
                      "Ligar",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.blue,
                    ),
                    Text(
                      "Mensagem SMS",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.videocam,
                      color: Colors.blue,
                    ),
                    Text(
                      "Vídeo",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    Text(
                      "Enviar email",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact.phone),
                          Text("Celular"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  Text("nicole.costa@gmail.com"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => EditContact(contact: contact)),
          );
        }),
      ),
    );
  }
}
