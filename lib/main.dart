import 'package:bhagavat_geeta/routes/routes.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()..checkTheme()),
      ],
      child: Consumer<HomeProvider>(builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(color: Color(0xfff67f21)),
          ),
          darkTheme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(color: Color(0xfff67f21)),
          ),
          themeMode: (value.isdarkmode)
              ? ThemeMode.dark
              : value.isdarkmode
                  ? ThemeMode.dark
                  : ThemeMode.light,
          routes: Routes().allRoutes,
        );
      }),
    );
  }
}
