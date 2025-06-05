import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lilac_test/myapp.dart';

main(List<String> args) async {

  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}