import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/presentation/widgets/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'package:movies_app/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}
