import 'package:flutter/material.dart';
import 'views/user_details.dart';
import 'views/food_details.dart';
import 'views/favourite.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String favouritesViewRoute = '/favourite';
const String foodDetailsViewRoute = '/food_details';
const String userDetailsViewRoute = '/user_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case favouritesViewRoute:
      return MaterialPageRoute(builder: (_) => FavouritePage());
    case foodDetailsViewRoute:
      return MaterialPageRoute(builder: (_) => FoodDetailsPage());
    case userDetailsViewRoute:
      return MaterialPageRoute(builder: (_) => UserDetailsPage());

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
