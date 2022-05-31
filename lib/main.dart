import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindpeers_assigment/mindpeers_material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MindPeersMaterial()));
}
