import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdphotomap/firebase_options.dart';
import 'package:jdphotomap/src/features/app/presentation/page/app.dart';
import 'package:jdphotomap/src/injection/injection.dart' as di;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

const MethodChannel _channel = MethodChannel('mapbox_channel');

Future<String> _getMapboxToken() async =>
    await _channel.invokeMethod('getMapboxToken');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String accessToken = await _getMapboxToken();
  MapboxOptions.setAccessToken(accessToken);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const App());
}
