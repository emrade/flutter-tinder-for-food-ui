import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/price_rating_bar.dart';
import '../models/resturant.dart';
import 'rating_bar.dart';

class ResturantCardBig extends StatelessWidget {
  final Resturant resturant;
  final double width;

  const ResturantCardBig({Key key, @required this.resturant, this.width = 0.9}) : super(key: key);
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
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final _location = Row(
      children: <Widget>[
        Text(
          resturant.location,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white60,
          ),
        ),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        Text(
          resturant.type,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white60,
          ),
        ),
      ],
    );

    final _rating = Row(
      children: <Widget>[
        RatingBar(rating: resturant.rating, color: Colors.white, size: 20.0,),
        SizedBox(width: 5.0),
        _filledCircle,
        SizedBox(width: 5.0),
        PriceRatingBar(rating: resturant.priceScale, size: 20.0,),
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

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 4.0,
          child: Container(
            height: screenHeight * 0.6,
            width: screenWidth * width,
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
    );
  }
}
