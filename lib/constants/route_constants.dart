import 'package:flutter/material.dart';
import 'package:pet_adopt/screens/adopted_pets_screen.dart';
import 'package:pet_adopt/screens/pet_details_screen.dart';
import 'package:pet_adopt/screens/pet_list_screen.dart';

class Router {
  static buildRoutesTable() {
    Map<String, Widget Function(BuildContext)> routerTable = {
      PetListScreen.routeName: (context) => const PetListScreen(),
      PetDetailsScreen.routeName: (context) => const PetDetailsScreen(),
      AdoptedPetsScreen.routeName: (context) => const AdoptedPetsScreen()
    };

    return routerTable;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PetDetailsScreen.routeName:
        return MaterialPageRoute(builder: (_) => PetDetailsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("Error")),
                ));
    }
  }
}
