import 'package:flutter/widgets.dart';

const primaryColor = const Color(0xFF77DC58);
const primaryLight = const Color(0xFF494A68);
const primaryDark = const Color(0xFF424361);

const primaryGradientStart = const Color(0xFF65BCD0);
const primaryGradientEnd = const Color(0xFF37EBBB);
const primaryGradient = const LinearGradient(
  colors: const [primaryGradientStart, primaryGradientEnd],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const statusBarColor = primaryLight;
const appBarColor = primaryLight;
const scaffoldColor = primaryDark;
const bottomNavBarColor = primaryLight;
