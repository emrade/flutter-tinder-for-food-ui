import 'package:flutter/material.dart';

class PriceRatingBar extends StatelessWidget {
  final int dollarCount;
  final int rating;
  final Color color;
  final double size;

  const PriceRatingBar(
      {Key key,
      this.dollarCount = 3,
      this.rating = 0,
      this.color = Colors.white,
      this.size = 15.0})
      : super(key: key);

  Widget _buildDollars(BuildContext context, int index) {
    String dolls = "\$";
    Color iColor = Colors.grey.withOpacity(0.7);

    if (index < rating) {
      dolls = "\$";
      iColor = Colors.white;
    } else if (index > rating - 1 && index < rating) {
      dolls = "\$";
    }
    return Text(
      dolls,
      style:
          TextStyle(color: iColor, fontWeight: FontWeight.bold, fontSize: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(dollarCount, (i) => _buildDollars(context, i)),
    );
  }
}
