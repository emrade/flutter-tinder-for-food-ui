import 'package:flutter/material.dart';
import 'package:tinder_for_food/widgets/resturant_card.dart';
import '../../models/resturant.dart';

class SavedPage extends StatelessWidget {
  bool isOddNumber(int number) {
    return number % 2 == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final _body = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 40.0,
            bottom: 40.0,
          ),
          sliver: SliverGrid.count(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: resturants.map(
              (resturant) {
                int index = resturants.indexOf(resturant);
                bool isOddNum = isOddNumber(index);
                if (isOddNum) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      ResturantCard(resturant: resturant)
                    ],
                  );
                } else {
                  return ResturantCard(resturant: resturant);
                }
              },
            ).toList(),
          ),
        )
      ],
    );

    final _body2 = SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 40.0,
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              ResturantCard(resturant: resturants[0]),
              ResturantCard(resturant: resturants[1]),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              ResturantCard(resturant: resturants[2]),
              ResturantCard(resturant: resturants[3]),
            ],
          ),
        ],
      ),
    );

    return _body2;
  }

  Widget buildList() {
    List<Resturant> leftSide = [];
    List<Resturant> rightSide = [];
    resturants.forEach((resturant) {
      int index = resturants.indexOf(resturant);
      bool isOddNum = isOddNumber(index);

      isOddNum ? rightSide.add(resturant) : leftSide.add(resturant);
    });

    return Row(
      children: <Widget>[
        Column(
          children:
              leftSide.map((res) => ResturantCard(resturant: res)).toList(),
        ),
        Column(
          children: rightSide.map((res) {
            return Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                ResturantCard(resturant: res),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
