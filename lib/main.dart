import 'package:flutter/material.dart';
import 'package:spotify/components/auth.dart';
void main(){
  runApp(new MaterialApp(
    title: 'Spotify',
    theme: ThemeData(
      fontFamily: 'Proxima Nova',
//      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      ),
    home: SplashScreen(),
    ),
  );
}