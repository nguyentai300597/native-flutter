import 'package:countflutter/channel/method_channel_helper.dart';
import 'package:countflutter/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondsPage extends StatefulWidget with Native {
  const SecondsPage({Key? key}) : super(key: key);

  @override
  State<SecondsPage> createState() => _SecondsPageState();

  @override
  void initpage() {
    print("object12312312");
    AmazonFileUpload.streamData.listen((event) {
      print("========$event--------");
    });
  }

  @override
  int sendNativetoflutter(int data) {
    // TODO: implement sendNativetoflutter
    throw UnimplementedError();
  }
}

class _SecondsPageState extends State<SecondsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text("on back"),
        onPressed: () {
          //Navigator.pop(context);
          //  SystemNavigator.pop(animated: true);
          getdata();
          AmazonFileUpload().uploadFile();
        },
      )),
    );
  }

  getdata() async {
    final data = await Api().search(SearchRequest(query: "nguyen"));
    print("getdata${data}");
  }
}
