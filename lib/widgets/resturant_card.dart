import 'dart:ui';

import 'package:flutter/material.dart';
import '../router.dart';
import '../widgets/price_rating_bar.dart';
import '../models/resturant.dart';
import 'rating_bar.dart';

class ResturantCard extends StatelessWidget {
  final Resturant resturant;

  const ResturantCard({Key key, @required this.resturant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _filledCircle = Container(
      height: 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white60,
      ),
    );

    final _name = Text(
      resturant.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final _location = Row(
      children: <Widget>[
        Text(
          resturant.location,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white60,
          ),
        ),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        Text(
          resturant.type,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white60,
          ),
        ),
      ],
    );

    final _rating = Row(
      children: <Widget>[
        RatingBar(rating: resturant.rating, color: Colors.white),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        PriceRatingBar(rating: resturant.priceScale),
      ],
    );

    final _details = Positioned(
      bottom: 20.0,
      left: 10.0,
      right: 10.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            height: screenHeight * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_name, _location, _rating],
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          resturantDetailsViewRoute,
          arguments: resturant,
        );
      },
      child: Stack(
        children: <Widget>[
          Hero(
            tag: resturant.id,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              height: screenHeight * 0.4,
              width: screenWidth * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(resturant.photo),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          _details
        ],
      ),
    );
  }
}
