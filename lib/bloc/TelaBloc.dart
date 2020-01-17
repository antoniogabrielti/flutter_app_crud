import 'dart:async';
import 'dart:convert';
import 'package:flutter_app_crud/model/User.dart';
import 'package:flutter_app_crud/model/data/UserDAO.dart';
import 'package:http/http.dart' show Client;

class TelaBloc {
  var url = 'http://www.mocky.io/v2/5e20cec5300000b3a4d1f22f';

  var controller = StreamController.broadcast();
  Stream get webStream => controller.stream;

  void getLoadData() async {
    controller.sink.add(null);

    var result = await Client().get(Uri.parse(url));

    if (result.statusCode == 200) {
      var userDAO = UserDAO();

      var map = json.decode(result.body);

      var user = User.fromJson(map);

      userDAO.insertUser(user);

      controller.sink.add("Download completo");
    } else {
      controller.sink.add('Erro [${result.statusCode}]');
    }
  }


  void getData() async {
    controller.sink.add(null);

    var userDAO = UserDAO();

    var list = await userDAO.findAll();

    controller.sink.add('Olá' + list.elementAt(0)['name']);

  }


}
