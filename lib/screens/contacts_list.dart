import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/models/contact.dart';
import 'package:flutter_alura_bytebank_curso2/screens/contact_form.dart';

class ContactsListWidget extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: this.contacts.length,
        itemBuilder: (ctx, index) {
          return ContactItemWidget(
            contact: this.contacts[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute<Contact>(
                      builder: (context) => ContactFormWidget()))
              .then((value) => debugPrint(value.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          this.contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          this.contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
