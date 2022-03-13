

import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  Api({required this.userId, required this.id, required this.title, required this.body});
  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json["body"]);
  }
}

Future<List<Api>> fetchPost() async {
  print("requesting..");


  final data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var jsonList = json.decode(data.body);
  List<Api> apis =[];

  for(var i in jsonList){
    Api api = Api(userId:i['userId'], id: i['id'], title: i['title'], body: i['body']);

    apis.add(api);
  }

  print(apis.length);
  return apis;

  /*//Revisamos si la respuesta es OK
  if (data.statusCode == 200) {
    //Listado de objetos json
    var jsonList = json.decode(response.body);
    print(jsonList);
    //hacemos un mapeo, pasamos cada elemento a un objeto Fruta
    return jsonList.map((i) => new Api.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }*/
}
