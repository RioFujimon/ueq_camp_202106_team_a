import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_bottom_navigation.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';

class Screen5 extends StatelessWidget {
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
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 50,
              // color: Colors.white70,
              margin: EdgeInsets.fromLTRB(5, 20, 20, 20),
              child: ListTile(
                leading:NeumorphicIcon(
                  Icons.person,
                  size: 45,
                ),
                title: Text("User Name",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              // 背景色
              child: Text('気になっている人とのデートですが何を着ていけばいいか全然わからないので誰かコーディネートお願いします'),
            )
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


