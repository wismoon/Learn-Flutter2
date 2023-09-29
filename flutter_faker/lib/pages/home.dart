import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class homepage extends StatelessWidget {
  
  var faker = new Faker();

  String tanggal = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faker"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage("https://picsum.photos/${200 +index}/300"),
          ),
          title: Text("${faker.person.name()}"),
          subtitle: Text("${DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(tanggal))}"),
        ),),

    );
  }
}

