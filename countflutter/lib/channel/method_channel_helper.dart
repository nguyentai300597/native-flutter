import 'dart:async';

import 'package:flutter/services.dart';

class AmazonFileUpload {
  static const platform = const MethodChannel('amazon');
  static StreamController<String> _controller = StreamController.broadcast();

  static Stream get streamData => _controller.stream;

  Future<BaseResponse> uploadFile() async {
    print("12312321312321");
    try {
      platform.setMethodCallHandler((call) async {
        if (call.method.contains("other")) {
          _controller.add("");
        }
      });
      final Map result = await platform.invokeMethod('s3_upload');
      return BaseResponse(result["success"], result["error"], "");
    } on PlatformException catch (e) {
      return BaseResponse(false, e.message, "");
    }
  }
}

class BaseResponse {
  final bool? successs;
  final String? sms;
  final String? des;
  BaseResponse(this.successs, this.sms, this.des);
}
