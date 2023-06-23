import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/food_details_columnwidets.dart';

final pageController = PageController(viewportFraction: 0.85);
final double _height = Dimension.pageViewSizedBox;
var _currentPageValue = 0.0;
var scaleFactor = 0.8;
Widget buildFoodPageBody(int index) {
  //!Scaling up and down
  Matrix4 matrix = Matrix4.identity();
  if (index == _currentPageValue.floor()) {
    //currscale for scaling.
    var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
    //currTrans for right transform
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } //?else if
  else if (index == _currentPageValue.floor() + 1) {
    var currScale =
        scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } //?else if
  else if (index == _currentPageValue.floor() - 1) {
    var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } //*else
  else {
    matrix = Matrix4.diagonal3Values(1, scaleFactor, 1)
      ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 0);
  }
  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        //!Top image
        Container(
          height: Dimension.pageViewContainer,
          width: double.infinity,
          margin: EdgeInsets.only(
              right: Dimension.widthLR10, left: Dimension.widthLR10),
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimension.radius30),
            ),
            child: Image.asset(
              'assets/images/4.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        //!Stacked bottom image
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimension.pageViewTextContainer,
            width: double.infinity,
            margin: EdgeInsets.only(
                right: Dimension.widthLR30,
                left: Dimension.widthLR30,
                bottom: Dimension.heightTB30),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimension.radius20),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimension.widthLR15,
                    right: Dimension.widthLR15,
                    top: Dimension.heightTB15),
                child: const FoodDetails(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
