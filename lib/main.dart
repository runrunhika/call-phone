import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Phone'),
        centerTitle: true,
      ),
      body: Center(
        child: buildButton(),
      ),
    );
  }

  Widget buildButton() {
    final number = '+238192019121';

    return ListTile(
      title: Text('Sample Tester'),
      subtitle: Text(number),
      trailing: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape:
                  RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
              textStyle: TextStyle(fontSize: 24)),
          onPressed: () async {
            launch('tel://$number');

            await FlutterPhoneDirectCaller.callNumber(number);
          },
          child: Text('Call')),
    );
  }
}
