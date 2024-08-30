import 'package:comic_book_app/src/config/env/env.dart';
import 'package:comic_book_app/src/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  Env(EnvMode.sandbox);
  runApp(const App());
}
