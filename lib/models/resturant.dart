import '../utils/utils.dart';

class Resturant {
  int id;
  String photo;
  String name;
  String location = "Richmond";
  String type;
  String date = "a week ago";
  String distance = "5.2km away";
  int priceScale; // 1, 2 or 3
  double rating;

  Resturant(this.id, this.photo, this.name, this.type, this.priceScale, this.rating);
}

List<Resturant> resturants = [
  Resturant(1, AvailableImages.burger, "The Beer & Burger Bar", "Hamburger Resturant", 1, 5.0),
  Resturant(2, AvailableImages.burger, "Taco Jill", "Mexican", 1, 4.5),
  Resturant(3, AvailableImages.burger, "Gellato Messina", "Mexican", 2, 5.0),
  Resturant(4, AvailableImages.burger, "The Industrial Cafe", "Cafe", 2, 5.0),
];