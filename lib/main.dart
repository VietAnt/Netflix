import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Bloc_cinema/cinema_bloc.dart';
import 'package:netflix/Models/movie_model.dart';
import 'package:netflix/Routes/routes.dart';
import 'package:netflix/Screen/details_movie_page.dart';
import 'package:netflix/Screen/home_cine_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
        providers: [
          BlocProvider<CinemaBloc>(create: (context) => CinemaBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Frave-Student',
          initialRoute: '/',
          routes: routes,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColorBrightness: Brightness.light,
              visualDensity: VisualDensity.adaptivePlatformDensity),
        ));
  }
}
