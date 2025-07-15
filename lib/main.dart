import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jdphotomap/firebase_options.dart';
import 'package:jdphotomap/src/features/app/presentation/page/app.dart';
import 'package:jdphotomap/src/injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const App());
}
