flutter pub run pigeon \
  --input pigeons/search.dart \
  --dart_out lib/searchpigeon.dart \
  --objc_header_out .ios/Runner/pigeon.h \
  --objc_source_out .ios/Runner/pigeon.m \
  --experimental_swift_out .ios/Runner/Pigeon.swift \
  --java_out ./.android/Flutter/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "io.flutter.plugins"