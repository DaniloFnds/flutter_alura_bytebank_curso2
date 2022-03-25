import '../database/app_database.dart';
import '../models/contact.dart';

Future<int> save(Contact contact) async {
  var dbCon = await getDataBase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return dbCon.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  var dbCon = await getDataBase();
  var maps = await dbCon.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> map in maps) {
    final Contact contact = Contact(
      map['id'],
      map['name'],
      map['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}