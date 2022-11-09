import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/ui/details/details_view.dart';
import 'package:weatherapp/ui/home/home_view.dart';

void main() => runApp(const MyApp());

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
              home: Scaffold(body:  DetailsView()),
            ));
  }
}
