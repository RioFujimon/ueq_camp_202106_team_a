import 'package:flutter/material.dart';

class CustomMaterialPageRoute extends MaterialPageRoute {
  CustomMaterialPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
