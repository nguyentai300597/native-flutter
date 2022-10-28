// Autogenerated from Pigeon (v4.2.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class SearchRequest {
  SearchRequest({
    this.query,
  });

  String? query;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['query'] = query;
    return pigeonMap;
  }

  static SearchRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SearchRequest(
      query: pigeonMap['query'] as String?,
    );
  }
}

class _ApiCodec extends StandardMessageCodec{
  const _ApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SearchRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return SearchRequest.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class Api {
  /// Constructor for [Api].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  Api({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ApiCodec();

  Future<String> search(SearchRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.Api.search', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }
}

abstract class Native {
  static const MessageCodec<Object?> codec = StandardMessageCodec();

  int sendNativetoflutter(int data);
  void initpage();
  static void setup(Native? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.Native.sendNativetoflutter', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.Native.sendNativetoflutter was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_data = (args[0] as int?);
          assert(arg_data != null, 'Argument for dev.flutter.pigeon.Native.sendNativetoflutter was null, expected non-null int.');
          final int output = api.sendNativetoflutter(arg_data!);
          return output;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.Native.initpage', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          // ignore message
          api.initpage();
          return;
        });
      }
    }
  }
}