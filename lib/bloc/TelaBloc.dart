import 'dart:async';
import 'package:http/http.dart' show Client;

class TelaBloc {
  var url = 'http://www.mocky.io/v2/5e20cec5300000b3a4d1f22f';

  var controller = StreamController.broadcast();
  Stream get webStream => controller.stream;

  void getData() async {
    controller.sink.add(null);

    var map = {"chave":"valor"};

    print(map['chave']);

    var result = await Client().get(Uri.parse(url));

    if (result.statusCode == 200) {
      controller.sink.add(result.body);
    } else {
      controller.sink.add('Erro [${result.body}');
    }
  }
}
