import 'package:flutter/services.dart';

Future<String> getTxtAsset(String path) async {
  return await rootBundle.loadString(path);
}
