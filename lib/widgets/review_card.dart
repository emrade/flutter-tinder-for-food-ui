import 'package:flutter/material.dart';
import 'package:tinder_for_food/router.dart';
import '../widgets/rating_bar.dart';
import '../models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key key, @required this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _filledCircle = Container(
      height: 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.6),
      ),
    );

    final img = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, resturantDetailsViewRoute,
            arguments: review.resturantId);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(
              review.resturantPhoto,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final _name = InkWell(
      onTap: () {
        Navigator.pushNamed(context, resturantDetailsViewRoute,
            arguments: review.resturantId);
      },
      child: Text(
        review.resturantName,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final _location = Row(
      children: <Widget>[
        Text(
          review.location,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        Text(
          review.resturantType,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      ],
    );

    final _content = Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        review.content,
        style: TextStyle(),
      ),
    );

    final _hr = Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 0.8,
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.grey.withOpacity(0.4),
    );

    final _rating = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          RatingBar(rating: review.rating),
          SizedBox(width: 5.0),
          _filledCircle,
          SizedBox(width: 5.0),
          Text(
            review.date,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.withOpacity(0.8),
            ),
          )
        ],
      ),
    );

    final details = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_name, _location, _content, _rating, _hr],
      ),
    );

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[img, details],
      ),
    );
  }
}
