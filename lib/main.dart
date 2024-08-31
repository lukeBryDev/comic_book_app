import 'package:comic_book_app/src/config/env/env.dart';
import 'package:comic_book_app/src/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await dotenv.load(fileName: '.env');
  Env(EnvMode.sandbox);
  runApp(const App());
}
