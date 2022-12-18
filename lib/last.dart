import 'package:flutter/material.dart';
class LastPage extends StatelessWidget {
  late List<dynamic> sayings;
  late int id;
   LastPage({super.key, required this.sayings,required this.id});
  @override
  Widget build(BuildContext context) {
    final user= sayings[id];
    List<dynamic> data=user["sayings"];
    return
      Scaffold(
        appBar: AppBar(
          title: Text("News Articles"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){

            String show=data[index].toString();
        return ListTile(
          title: Text(show),
        );
    },
    ),
      );
  }
}
