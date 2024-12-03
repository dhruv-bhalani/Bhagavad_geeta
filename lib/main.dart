import 'package:bhagavat_geeta/routes/routes.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:bhagavat_geeta/screen/settingscreen/view/settingprovider.dart';
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
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SettingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.deepOrangeAccent,
          ),
        ),
        routes: Routes().allRoutes,
      ),
    );
  }
}
