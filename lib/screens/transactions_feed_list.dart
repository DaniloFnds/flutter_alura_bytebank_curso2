import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/components/centred_message.dart';
import 'package:flutter_alura_bytebank_curso2/http/webclient.dart';

import '../models/transaction.dart';

class TransactionsFeedWidget extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: getAll(),
        builder: (context, snapshot) {
          final List<Transaction> transactions = snapshot.hasData ? snapshot.data : [];
          if(transactions.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final Transaction transaction = transactions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text(
                      transaction.value.toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transaction.contact.accountNumber.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            );
          }
          return CenteredMessage('No transcations found');
        },
      ),

    );
  }
}