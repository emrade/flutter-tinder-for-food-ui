import 'package:flutter/material.dart';
import '../models/resturant.dart';

class ResturantCard extends StatelessWidget {
  final Resturant resturant;

  const ResturantCard({Key key, @required this.resturant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _details = Container(
      child: Text(resturant.name, style: TextStyle(color: Colors.white),),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(resturant.photo),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: _details,
    );
  }
}