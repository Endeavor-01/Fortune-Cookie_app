import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortune_cookie_app/providers/FortuneModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => FortuneModel(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // String _currentFortune = "";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fortune cookie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    final change = Provider.of<FortuneModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assests/images/fortune_cookie.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20,),
            // Text(
            //   'click to see ahead ',
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),SizedBox(height: 20,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                Text(
                  change.fortune ,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),SizedBox(height: 40,),
            ElevatedButton(onPressed: ()=> change.getNewFortune(), child: Text("Get Fortune"))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _randomCookie,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
