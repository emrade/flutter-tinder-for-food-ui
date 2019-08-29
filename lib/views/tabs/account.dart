import 'package:flutter/material.dart';
import '../../widgets/review_card.dart';
import '../../models/review.dart';
import '../../utils/utils.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final userImage = Positioned(
      top: deviceHeight * 0.09,
      left: deviceWidth * 0.28,
      child: Container(
        height: 180.0,
        width: 180.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AvailableImages.woman),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );

    final circle1 = Positioned(
      top: deviceHeight * 0.09,
      right: deviceWidth * 0.18,
      child: _buildGradientCircle(90.0),
    );
    final circle2 = Positioned(
      top: deviceHeight * 0.17,
      left: deviceWidth * 0.13,
      child: _buildGradientCircle(70.0),
    );
    final circle3 = Positioned(
      top: deviceHeight * 0.29,
      right: deviceWidth * 0.33,
      child: _buildGradientCircle(40.0),
    );

    final userNameAndLocation = Positioned(
      top: deviceHeight * 0.38,
      left: 0,
      right: 0,
      child: Column(
        children: <Widget>[
          Text(
            "Isabella M.",
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
          ),
          Text(
            "Melbourne, Australia",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

    final userImageSection = Container(
      height: deviceHeight * 0.5,
      child: Stack(
        children: <Widget>[
          circle1,
          circle2,
          circle3,
          userImage,
          userNameAndLocation
        ],
      ),
    );

    final br = Radius.circular(30.0);

    final reviewList = reviews.map((review) => ReviewCard(review: review)).toList();

    final reviewsSection = Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: br, topLeft: br),
      ),
      constraints: BoxConstraints(minHeight: deviceHeight / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Your Reviews",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: reviewList,
          )
        ],
      ),
    );
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[userImageSection, reviewsSection],
        ),
      ),
    );
  }

  Widget _buildGradientCircle(double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFECF9E8),
            Color(0xFFE6F6EF),
          ],
        ),
      ),
    );
  }
}
