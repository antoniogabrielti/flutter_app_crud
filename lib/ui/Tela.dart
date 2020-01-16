import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_crud/bloc/TelaBloc.dart';
import 'package:flutter_app_crud/model/User.dart';
import 'dart:convert';

class Tela extends StatefulWidget {
  Tela({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  var _bloc = TelaBloc();

  @override
  void initState() {
    print("init state");
    _bloc.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                initialData: null,
                stream: _bloc.webStream,
                builder: (context, snapshot) {

                  print("StreamBuilder ${snapshot.data}");
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }

                  var map = json.decode(snapshot.data);
                  var user = User.fromJson(map);

                  return Text('Olá ${user.name}');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _bloc.getData();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
