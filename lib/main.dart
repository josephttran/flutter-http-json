import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
  home: Flutter(),
  )
);

class Flutter extends StatefulWidget {
  @override
  createState() => FlutterState();
}

class FlutterState extends State<Flutter> {
  List _users;
  final _font = TextStyle(fontSize: 18.0, color: Colors.cyan);

  _getData() async {
    String dataUrl = "https://jsonplaceholder.typicode.com/users";   
    var res = await http.get(dataUrl);

    setState(() {
      _users = json.decode(res.body);
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter http data"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: _users == null ? 0 : _users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: const EdgeInsets.all(14.0),                                         
                      child: Text("name: ${_users[index]["name"]}", style: _font)
                  ),
                  Card(
                    child: Container(
                    padding: const EdgeInsets.all(14.0),                    
                    child: Text("username: ${_users[index]["username"]}", style: _font)
                    )
                  )
                ],
              )
            )
            
          );
        }
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }
}