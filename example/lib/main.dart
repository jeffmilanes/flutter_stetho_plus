import 'package:flutter/material.dart';
import 'package:flutter_stetho_plus/flutter_stetho_plus.dart';
import 'package:http/http.dart' as http;

void main() {
  Stetho.initialize();

  runApp(new FlutterStethoExample(
    client: new http.Client(),
  ));
}

class FlutterStethoExample extends StatelessWidget {
  late final http.Client client;

  FlutterStethoExample({Key? key, required this.client}) : super(key: key);

  fetchImage() {
    client.get(
      Uri.parse(
          'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png'),
      headers: {'Authorization': 'token'},
    );
  }

  fetchJson() {
    client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {'Authorization': 'token'},
    );
  }

  fetchError() {
    client.get(Uri.parse('https://jsonplaceholder.typicode.com/postadsass/1'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: fetchJson,
                  child: Text("Fetch json"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: fetchImage,
                  child: Text("Fetch image"),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: fetchError,
                  child: Text("Fetch with Error"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
