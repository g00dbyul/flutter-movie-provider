import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movie/src/home.dart';
import 'package:provider_movie/src/provider/bottom_navigation_provider.dart';
import 'package:provider_movie/src/provider/count_provider.dart';
import 'package:provider_movie/src/provider/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (BuildContext context) => CountProvider()),
            ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
            ChangeNotifierProvider(create: (BuildContext context) => MovieProvider()),
          ],
          child: Home(),
        )
    );
  }
}
