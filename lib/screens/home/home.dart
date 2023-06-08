import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/model/list_of_contacts.dart';
import 'package:agenda_de_contatos/repository/contact_repository.dart';
import 'package:flutter/material.dart';

import 'components/item_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Meus contatos"),
      ),
      body: FutureBuilder(
        future: ContactRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data != null && snapshot.hasData) {
            final contacts = snapshot.data! as List<Contact>;
            return Container(
              margin: EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (_, index) {
                  return ItemList(
                    contact: contacts[index],
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider();
                },
              ),
            );
          } else {
            return Center(
              child: Text("Não existem contatos cadastrados!!!"),
            );
          }
        },
      ),
    );
  }
}
