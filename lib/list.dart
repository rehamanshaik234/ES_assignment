

import 'dart:convert';

import 'package:api_demo/last.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List users= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rest API"),),
      body:
          ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              final user= users[index];
                String data=user['name']['first'];
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  LastPage( sayings: users,id: index,)));
              },
              child: ListTile(
                title: Text(data==""? "No name": data,style: TextStyle(color: Colors.black),
                ),
                leading: Text((index+1).toString()),
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchUser();
      },tooltip: "Fetch Users",
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blue,

      )
    );
  }
  void fetchUser() async {
    const url = 'https://api.sampleapis.com/futurama/characters';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final json= jsonDecode(response.body);
    setState(() {
      users=json;
    });
  }
}
