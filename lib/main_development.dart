import 'package:flutter/material.dart';
import 'package:resident_app/app/app.dart';
import 'package:resident_app/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
