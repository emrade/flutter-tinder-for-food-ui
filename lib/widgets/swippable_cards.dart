import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/resturant_card_big.dart';
import '../models/resturant.dart';

class SwippableCards extends StatefulWidget {
  @override
  _SwippableCardsState createState() => _SwippableCardsState();
}

class _SwippableCardsState extends State<SwippableCards> {
  List<Widget> cardList;
  List<Resturant> _resturantsCopy = List.from(resturants.reversed);

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
      _resturantsCopy.removeAt(index);

      cardList = _getSwipeCards();
    });
  }

  @override
  void initState() {
    super.initState();

    cardList = _getSwipeCards();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: cardList,
      ),
    );
  }

  List<Widget> _getSwipeCards() {
    double initTop = 15.0;
    double initHor = 20.0;
    double initWidth = 0.9;
    List<Widget> cardList = new List();

    for (var i = 0; i < _resturantsCopy.length; i++) {
      // var width = initWidth - double.parse("0.$i");
      var width;
      if (i == _resturantsCopy.length) {
        width = 0.9;
      } else if (i == _resturantsCopy.length - 1) {
        width = initWidth - 0.05;
      } else if (i == _resturantsCopy.length - 2) {
        width = initWidth - 0.1;
      } else if (i == _resturantsCopy.length - 3) {
        width = initWidth - 0.15;
      } else {
        width = initWidth - 0.2;
      }
      cardList.add(
        Positioned(
          top: initTop * (i + 1),
          child: Draggable(
            feedback: Material(
              borderRadius: BorderRadius.circular(20.0),
              child: ResturantCardBig(resturant: _resturantsCopy[i]),
            ),
            childWhenDragging: Container(),
            onDragEnd: (drag) {
              _removeCard(i);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: initHor - (3 * (i + 1)),
                vertical: 10.0,
              ),
              child: ResturantCardBig(
                resturant: _resturantsCopy[i],
                width: width,
              ),
            ),
            data: _resturantsCopy[i],
          ),
        ),
      );
    }

    final footerBtns = Positioned(
      bottom: 20.0,
      left: 10.0,
      right: 10.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCircularBtn(40.0, AvailableImages.back, 1),
            _buildCircularBtn(70.0, AvailableImages.hate, 2),
            _buildCircularBtn(70.0, AvailableImages.like, 3),
            _buildCircularBtn(40.0, AvailableImages.list, 4),
          ],
        ),
      ),
    );

    cardList.add(footerBtns);

    return cardList;
  }

  Widget _buildCircularBtn(double height, String img, int type) {
    double imageSize;

    if (type == 1 || type == 4) {
      imageSize = 25.0;
    } else {
      imageSize = 35.0;
    }

    return MaterialButton(
      color: Colors.white,
      elevation: 4.0,
      onPressed: () {},
      height: height,
      shape: CircleBorder(),
      child: Container(
        height: 40.0,
        child: Image.asset(
          img,
          height: imageSize,
          width: imageSize,
        ),
      ),
    );
  }
}
