import 'package:flutter/material.dart';
import 'package:pet_adopt/constants/route_constants.dart' as routes;
import 'package:pet_adopt/constants/theme_constants.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:pet_adopt/screens/pet_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PetProvider())],
      child: MaterialApp(
        title: 'Pet adopt',
        debugShowCheckedModeBanner: false,
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        themeMode: ThemeMode.system,
        routes: routes.Router.buildRoutesTable(),
        onGenerateRoute: routes.Router.generateRoute,
        home: PetListScreen(),
      ),
    );
  }
}
