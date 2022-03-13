import 'package:flutter/material.dart';

import '../models/tit.dart';

class DetallePagina extends StatelessWidget {
  final Api? api;
  const DetallePagina(this.api);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          api?.title ?? 'null',
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Text('userId: ${api?.userId}'),
            Text('id: ${api?.id}'),
            Text(api?.body ?? 'null'),
          ],

        ),
      ),
    );
  }
}
