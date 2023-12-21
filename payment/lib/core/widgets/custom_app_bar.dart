import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';
import '../utils/style.dart';

AppBar buildAppBar({required final String title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        AssetsData.arrowBack,
      ),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: Styles.style25,
    ),
  );
}
