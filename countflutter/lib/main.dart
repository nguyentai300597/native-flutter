import 'dart:developer';
import 'dart:ui';

import 'package:countflutter/seconpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(chooseWidget(window.defaultRouteName));

Widget chooseWidget(String route) {
  switch (route) {
    case 'flutter_fragment':
      return MyApp();
    default:
      return const MaterialApp(
        home: SecondsPage(),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => MyHomePage());
            break;
          case '/second':
            return MaterialPageRoute(builder: (context) => Seconpage());
            break;
        }
      },
      // routes: <String,WidgetBuilder>{
      //   '/':(context)=>MyHomePage(),
      //   '/second':(context)=>Seconpage()
      // },
      onUnknownRoute: (RouteSettings setting) {
        String? unknownRoute = setting.name;
        return MaterialPageRoute(
            builder: (context) => Container(
                  color: Colors.red,
                ));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const platform = MethodChannel("FLUTTER_CHANNEL");
  String _responseFromNativeCode = 'Waiting for Response...';

  void _incrementCounter() async {
    var channel = const MethodChannel('"flutter.native/helper"');
    // var dataToPass = <String, dynamic>{
    //   'os': 'Android',
    // };
    // platform.invokeListMethod<String>('helloFromNativeCode', "dataToPass").then((value){
    //   log("invokeListMethod${value}");
    // });   // platform.invokeListMethod<String>('helloFromNativeCode', "dataToPass").then((value){
    //   log("invokeListMethod${value}");
    // });
    platform.invokeMethod("helloFromNativeCode");
    // Navigator.pushNamed(context, "/second");
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // platform.setMethodCallHandler(nativeMethodCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("23213"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<dynamic> nativeMethodCallHandler(MethodCall methodCall) async {
    print('Native call!');
    switch (methodCall.method) {
      case "methodNameItz":
        return "This data from flutter.....";
        break;
      default:
        return "Nothing";
        break;
    }
  }

  Future<void> responseFromNativeCode() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('helloFromNativeCode');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }
}

class Seconpage extends StatelessWidget {
  const Seconpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
    );
  }
}
