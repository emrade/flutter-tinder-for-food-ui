import 'package:flutter/material.dart';
import 'views/food_details.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String foodDetailsViewRoute = '/food_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case foodDetailsViewRoute:
      return MaterialPageRoute(builder: (_) => FoodDetailsPage());

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
