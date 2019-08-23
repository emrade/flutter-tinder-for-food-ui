import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      bottom: TabBar(
        unselectedLabelColor: unselectedTabLabelColor,
        labelColor: Theme.of(context).primaryColor,
        indicator: BoxDecoration(
          gradient: primaryGradient,
        ),
        tabs: <Widget>[
          _buildTab(Icons.search),
          _buildTab(Icons.star),
          _buildTab(LineIcons.user),
        ],
      ),
    );

    final body = TabBarView(
      children: [
        Icon(Icons.search),
        Icon(Icons.star),
        Icon(LineIcons.user),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }

  Widget _buildTab(IconData icon) {
    return Tab(
      child: Icon(icon, size: 40.0),
    );
  }
}
