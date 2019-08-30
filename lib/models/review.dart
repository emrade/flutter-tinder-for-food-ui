import 'resturant.dart';

class Review {
  int id = 0;
  int resturantId;
  String resturantPhoto;
  String resturantName;
  String location = "Richmond";
  String resturantType;
  String date = "a week ago";
  double rating;
  String content;

  Review(this.resturantId, this.resturantPhoto, this.resturantName,
      this.resturantType, this.rating, this.content);
}

List<Review> reviews = [
  Review(
    resturants[0].id,
    resturants[0].photo,
    resturants[0].name,
    resturants[0].type,
    5.0,
    "Loved it! The staffs are friendly and they have amazing lunch deals.",
  ),
  Review(
    resturants[0].id,
    resturants[1].photo,
    resturants[1].name,
    resturants[1].type,
    4.9,
    "I come here everyday for my coffee! Love the staffs, they have such sweet hearts ❤️",
  )
];
