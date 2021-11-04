import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';

class Screen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          title: "Coordinate App",
          fontSize: 30.0,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: _buildVerticalItem,
        ),
        floatingActionButton: NeumorphicFloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
        bottomNavigationBar: NeumorphicBottomNavigation(),
      ),
    );
  }
}

Widget _buildVerticalItem(BuildContext context, int verticalIndex) {
  return Neumorphic(
    style: NeumorphicStyle(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      shape: NeumorphicShape.concave,
      depth: 5,
      intensity: 0.65,
      lightSource: LightSource.topLeft,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHorizontalItem(context, verticalIndex),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHorizontalItem(BuildContext context, int verticalIndex) {
  return SizedBox(
    height: 200,
    child: PageView.builder(
      controller: PageController(viewportFraction: 0.7),
      itemBuilder: (context, horizontalIndex) =>
          _buildHorizontalView(context, verticalIndex, horizontalIndex),
    ),
  );
}

Widget _buildHorizontalView(
    BuildContext context, int verticalIndex, int horizontalIndex) {
  final imageUrl =  'https://source.unsplash.com/random';
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Card(
      child: Image.network(imageUrl),
    ),
  );
}


