import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password)
      onConfirm; //esse negocio de colcoar os parentes no Function,é informar qual sera o tipo de retorno, e colocar o password é uma forma de dar o nome a esse parametro

  const TransactionAuthDialog({Key key, @required this.onConfirm})
      : super(key: key);

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: this._passwordController,
        keyboardType: TextInputType.number,
        obscureText: true,
        //esconder os caracteres,tipo um password
        maxLength: 4,
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(
          fontSize: 64.0,
          letterSpacing: 24, //criar um espaçamento entre as letras
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); //para fechar o dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(
              this._passwordController.text,
            ); //p[assando odados para o callback
            Navigator.pop(context);
          }, //para fechar o dialog,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
