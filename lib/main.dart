/* import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


void main()=>runApp(MiApp());
class MiApp extends StatelessWidget {
  const MiApp
  ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App image",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);  

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List data;
  Future<String> getData() async{
    var response = await http.get(
        Uri.encodeFull("https://webapipersonalesp.azurewebsites.net/api/People"),
        headers: {"Accept":"application/json"}
    );
    if(response.statusCode == 200){
      data = json.decode(response.body);
      print(data);
      // return data.map((people) => new People.fromJson(people)).toList();
    }
   /* else  {
      throw Exception('Falló al llamar a la Api !');
    }*/
    return "Satisfactorio";
  } 
  
  _InicioState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("MiApp con imagen"),
        ),
       body:  new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index){
                return new Card(
                  child: new Text(data[index]["Name"])
                  );
              },
            ),
       /* ListView( 
         children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Image.network("https://i.kym-cdn.com/photos/images/newsfeed/001/631/305/b1f.png"),
            ),
             Container(
              padding: EdgeInsets.all(20.0),
              child: Image.network("https://cdn.pixabay.com/photo/2021/01/14/20/32/fish-5917864_960_720.jpg"),
            ),
            new Center(
              child: new  RaisedButton(
                child: new Text("Obtener dato"),
                onPressed: getData )
            ),
          ] */
      
    );
  }
} */


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    
    print(data[1]["title"]);
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}

