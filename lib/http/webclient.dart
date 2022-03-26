import 'dart:convert';

import 'package:flutter_alura_bytebank_curso2/models/contact.dart';
import 'package:flutter_alura_bytebank_curso2/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Future<List<Transaction>> getAll() async {
  Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );
  var response =
      await client.get(Uri.parse('http://192.168.0.133:8080/transactions')).timeout(Duration(seconds: 5)); //colocar timeout
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> ele in decodedJson) {
    final Map<String, dynamic> contactJson = ele['contact'];
    final Transaction transaction = Transaction(
      ele['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.toString());
    return data;
  }
}
