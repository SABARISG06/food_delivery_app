import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewSizedBox = screenHeight / 2.78;
  static double pageViewContainer = screenHeight / 4.05;
  static double pageViewTextContainer = screenHeight / 6.85;

  //!Sizedbox
  static double sizedBoxheight10 = screenHeight / 89.0;
  static double sizedBoxheight20 = screenHeight / 44.5;
  static double sizedBoxwidth10 = screenWidth / 41.1;

  //!font-height:
  static double font12 = screenHeight / 74.17;
  static double font20 = screenHeight / 44.5;

  //! margin and padding,Positioned  TB->TopBottom, LR->LeftRight
  static double heightTB10 = screenHeight / 89.0;
  static double heightTB15 = screenHeight / 59.3;
  static double heightTB30 = screenHeight / 29.67;

  static double widthLR10 = screenWidth / 41.1;
  static double widthLR15 = screenWidth / 27.4;
  static double widthLR20 = screenWidth / 20.55;
  static double widthLR30 = screenWidth / 13.7;

  //!Border-Radius
  static double radius15 = screenHeight / 59.3;
  static double radius20 = screenHeight / 44.5;
  static double radius30 = screenHeight / 29.67;

  //!Container-height-width
  static double container45 = screenHeight / 19.78;

  //!Icon size
  static double icon24 = screenHeight / 37.08;

  //!ListView size
  static double listViewImgSize = screenHeight / 7.42;
  static double listViewBoxSize = screenWidth / 4.11;

  //!FoodDetailspage:- sizes
  static double imageContainer = screenHeight / 2.78;
  static double widthLR55 = screenWidth / 7.47;
}
