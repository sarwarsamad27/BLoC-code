import 'package:check_bloc/Bloc/favourite_app_bloc.dart';
import 'package:check_bloc/UI/favouriteApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Repository/favourite_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [

    BlocProvider(
    create: (context) => FavoriteAppBloc(FavoriteRepository() )
    ),


    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,

        useMaterial3: true,
      ),
    home:  favoriteApp(),
    )
    );
  }
}
