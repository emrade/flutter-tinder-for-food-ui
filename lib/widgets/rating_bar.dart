import 'package:flutter/material.dart';
import '../utils/colors.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  const RatingBar(
      {Key key,
      this.starCount = 5,
      this.rating = 0.0,
      this.color = primaryColor,
      this.size = 16.0})
      : super(key: key);

  Widget _buildStars(BuildContext context, int index) {
    IconData icName = Icons.star;
    Color iColor = color;

    if (index > rating) {
      icName = Icons.star_border;
      iColor = color.withOpacity(0.6);
    } else if (index > rating - 1 && index < rating) {
      icName = Icons.star_half;
    }
    return Icon(icName, size: size, color: iColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (i) => _buildStars(context, i)),
    );
  }
}
