import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/models/contact.dart';

class ContactFormWidget extends StatefulWidget {
  @override
  _ContactFormWidgetState createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: this._fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: this._accountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Account Number'),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                //usar esse SizedBox para aumentar um widget q nao tem propriedade de aumentar os lados
                width: double.maxFinite,
                //forma de deixar o maximo possivel do container
                child: ElevatedButton(
                  onPressed: () {
                    final Contact contact = Contact(0,
                      this._fullNameController.text,
                      int.tryParse(this._accountNumberController.text),
                    );

                    Navigator.pop(context, contact);
                  },
                  child: Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
