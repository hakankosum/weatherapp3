import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/ui/details/details_view.dart';
import 'package:weatherapp/ui/home/home_view.dart';

void main() => runApp(MultiProvider(providers:[
  ChangeNotifierProvider(create: (context) => WeatherProvider(),)
],
child:  MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (p0, p1, p2) => MaterialApp(
              theme: ThemeData(
                  textTheme: GoogleFonts.sourceSansProTextTheme(
                Theme.of(context).textTheme,
              )),
              title: 'Material App',
              home: Scaffold(body:  HomeView()),
            ));
  }
}
