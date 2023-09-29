import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("getX Stateless"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${data}",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    data -= 1;
                    print(data);
                  });
                }, 
                child: Text(" - ")),
                ElevatedButton(onPressed: () {
                  setState(() {
                    data += 1;
                    print(data);
                  });
                }, 
                child: Text(" + "))
              ],
            )
          ],
        ),
      ),
    );
  }
}