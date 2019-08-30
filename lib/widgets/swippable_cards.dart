import 'package:flutter/material.dart';
import '../widgets/resturant_card_big.dart';
import '../models/resturant.dart';

class SwippableCards extends StatefulWidget {
  @override
  _SwippableCardsState createState() => _SwippableCardsState();
}

class _SwippableCardsState extends State<SwippableCards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double initTop = 15.0;
    double initHor = 20.0;
    // List<Positioned> resturantList = [];
    // List<Resturant> _resturants = List.from(resturants);

    void removeItem(index) {
      resturants.removeAt(index);
      print("removed");
    }

    return Stack(
      children: resturants.map(
        (resturant) {
          int index = resturants.indexOf(resturant);
          return Positioned(
            top: initTop * (index + 1),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: initHor - (3 * (index + 1)),
                vertical: 10.0,
              ),
              child: Draggable(
                feedback: ResturantCardBig(resturant: resturants[index]),
                childWhenDragging: Container(),
                onDragEnd: (drag) {
                  removeItem(index);
                },
                child: ResturantCardBig(
                  resturant: resturant,
                ),
                data: resturant,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget emptyState() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 4.0,
      child: Container(
        height: screenHeight * 0.6,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red,
        ),
      ),
    );
  }
}
