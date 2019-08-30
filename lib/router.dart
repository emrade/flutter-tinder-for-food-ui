import 'package:flutter/material.dart';
import 'views/resturant_details.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String resturantDetailsViewRoute = '/food_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case resturantDetailsViewRoute:
      return MaterialPageRoute(builder: (_) => ResturantDetailsPage(resturant: settings.arguments));

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
