import 'dart:convert';

import 'package:flutter_alura_bytebank_curso2/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Client client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
);

Future<List<Transaction>> getAll() async {
  var response = await client
      .get(Uri.parse('http://192.168.0.133:8080/transactions'))
      .timeout(Duration(seconds: 5)); //colocar timeout
  final List<dynamic> decodedJson = jsonDecode(response.body);

  //outra forma de criar a lista a partir do List do jsonDecode
  final List<Transaction> transcations = decodedJson.map((e) => Transaction.fromJson(e)).toList();

  final List<Transaction> transactions = [];
  for (Map<String, dynamic> ele in decodedJson) {
    Transaction transaction = Transaction.fromJson(ele);
    // final Map<String, dynamic> contactJson = ele['contact'];
    // final Transaction transaction = Transaction(
    //   ele['value'],
    //   Contact(
    //     0,
    //     contactJson['name'],
    //     contactJson['accountNumber'],
    //   ),
    // );
    transactions.add(transaction);
  }
  return transactions;
}

Future<int> save(Transaction transaction, String password) async {
  final Map<String, dynamic> transactionMap = transaction.toJson();
  // forma direta=> final Map<String, dynamic> transactionMap = {
  //   'value': transaction.value,
  //   'contact': {
  //     'name': transaction.contact.name,
  //     'accountNumber': transaction.contact.accountNumber
  //   }
  // };
  final String jsonTransaction = jsonEncode(transactionMap);
  var response = await client.post(
    Uri.parse('http://192.168.0.133:8080/transactions'),
    headers: {'Content-type': 'application/json', 'password': password},
    body: jsonTransaction,
  );

  if (response.statusCode == 400) {
    throw Exception('ocorreu algum erro nos dados enviados');
  }

  if (response.statusCode == 401) {
    throw Exception('falha de autenticacao');
  }

  return response.statusCode;
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // print(data.toString());
    return data;
  }
}
