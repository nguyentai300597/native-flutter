import 'package:pigeon/pigeon.dart';

// class Book {
//   String? name;
//   String? urlimg;
// }

// @HostApi()
// abstract class bookAPI {
//   String search(String keyword);
// }

class SearchRequest {
  String? query;
}

class SearchReply {
  String? result;
}

@HostApi()
abstract class Api {
  String search(SearchRequest request);
}

@FlutterApi()
abstract class Native {
  int sendNativetoflutter(int data);
  void initpage();
}
