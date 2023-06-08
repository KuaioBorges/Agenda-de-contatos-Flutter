

import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/model/dao.dart';

class ContactRepository{
static final _table = "contacts";
  static Future<int> insertContact(Contact contact) async{
    final db = await DAO.getConnection();
    return await db.insert(_table, contact.toMap());
  }
  static Future<List<Contact>> findAll() async{
    final db = await DAO.getConnection();
    final elements= await db.query(_table);
    return elements.map(
      (element) => Contact.fromMap(element)
    ).toList();
  }

  static Future<int> updateContact(Contact contact) async{
    final db = await DAO.getConnection();
    return await db.update(
    _table, 
    contact.toMap(),
    where: "id=?",
    whereArgs: [contact.id], 
    );
  }
}