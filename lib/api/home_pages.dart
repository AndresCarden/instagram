

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/tit.dart';
import 'detalle.dart';

class MyApp extends StatelessWidget {
  final String title = "Listado de titulos";
  //Este es el Widget principal de la App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: this.title,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Page(
        title: Text(this.title),
        list: fetchPost(),
      ),
    );
  }
}

//Pantalla principal
class Page extends StatelessWidget {
  @required
  final Text title; //Titulo a mostrar
  @required
  final Future<List<Api>> list;
  Page({required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this.title,
      ),
      body: FutureBuilder<List<Api>>(
        future: fetchPost(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title.toString()),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetallePagina(snapshot.data[index])));
                    },
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

