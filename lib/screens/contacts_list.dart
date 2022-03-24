import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/models/contact.dart';
import 'package:flutter_alura_bytebank_curso2/screens/contact_form.dart';

class ContactsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Danilo',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<Contact>(builder: (context) => ContactFormWidget()))
          .then((value) => debugPrint(value.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
