import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/models/contact.dart';
import 'package:flutter_alura_bytebank_curso2/screens/contact_form.dart';
import 'package:flutter_alura_bytebank_curso2/screens/transaction_form.dart';

import '../dao/contact_dao.dart';

class TransferListWidget extends StatefulWidget {
  @override
  State<TransferListWidget> createState() => _TransferListWidgetState();
}

class _TransferListWidgetState extends State<TransferListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        //isso serve para inicar os dados q serao enviados para o future, ate o retorno do findAll
        //eele executa uma future antes, e entao ele executa o builder
        //podemos colocar um delayed pra demorar um pouco pra liberar a cosntrucao da tela
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          //usando o connectionState conseguimos ver todo o estado desse widget, e tratar todos os momentos
          switch (snapshot.connectionState) {
            //nao foi executado
            case ConnectionState.none:
              break;
            //estado verificando, esperando terminar
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
              break;
            //significa q ja tem um dado disponivel, mas nao foi finalziado o future..ref: streams,..vai devolvendo valores enquanto sao entregues
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts =
                  snapshot.hasData ? snapshot.data : [];
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (ctx, index) {
                  return TransferItemWidget(
                    contact: contacts[index],
                    onClick: () {
                      // debugPrint(contacts[index].toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionForm(
                              contacts[index],
                            ),
                          ));
                    },
                  );
                },
              );
              break;
          }
          //quando ocorre algum problema no future
          return Text('Unknown error ');
          //pelo snapsho pegamos o dado retornado pelo future-> findAll
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<Contact>(
                builder: (context) => ContactFormWidget()),
          ).then((value) {
            setState(
                () {}); // chamar o setState para forçar ele a refazer o builder do widget
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItemWidget extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const TransferItemWidget({Key key, this.contact, @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
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
