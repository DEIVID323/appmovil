import 'package:flutter/material.dart';
import 'package:jdphotomap/src/features/app/presentation/page/app.dart';
import 'package:jdphotomap/src/injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
