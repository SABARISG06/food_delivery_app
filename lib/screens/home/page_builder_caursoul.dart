import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/food_details_columnwidets.dart';
import 'package:food_delivery_app/widgets/icon_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodCaursoul extends StatefulWidget {
  const FoodCaursoul({super.key});

  @override
  State<FoodCaursoul> createState() => _FoodCaursoulState();
}

class _FoodCaursoulState extends State<FoodCaursoul> {
  final _pageController = PageController(viewportFraction: 0.85);
  final double _height = Dimension.pageViewSizedBox;
  var _currentPageValue = 0.0;
  var scaleFactor = 0.8; //! 0.8 is 80%

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //?Pageviewbuilder
        SizedBox(
          height: _height,
          // color: Colors.blueGrey,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildFoodPageBody(index);
              }),
        ),

        //?DotsIndicator
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(
          height: Dimension.heightTB30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: Dimension.widthLR20,
              ),
              child: const BigText(
                text: 'Popular',
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: Dimension.sizedBoxheight10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: SmallText(text: '.'),
            ),
            SizedBox(
              width: Dimension.sizedBoxheight10,
            ),
            const SmallText(
              text: 'Food pairing',
              color: Colors.black54,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        //List of food and images.
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: Dimension.widthLR15),
                child: Row(
                  children: [
                    //images section
                    SizedBox(
                      height: Dimension.listViewImgSize,
                      width: Dimension.listViewImgSize,
                      child: Card(
                        margin: EdgeInsets.only(
                          bottom: Dimension.heightTB10,
                        ),
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20)),
                        child: Image.asset(
                          'assets/images/5.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //text section
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: Dimension.widthLR20),
                        height: Dimension.listViewBoxSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.radius20),
                            bottomRight: Radius.circular(Dimension.radius20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimension.widthLR10,
                              right: Dimension.widthLR10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BigText(
                                text:
                                    'Indian Spicy Tasty Aloo parata with Butter chicken',
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: Dimension.sizedBoxheight10,
                              ),
                              const SmallText(
                                text: 'With Indian Characteristics',
                                color: Colors.black54,
                              ),
                              SizedBox(
                                height: Dimension.sizedBoxheight10,
                              ),

                              //*icons and text
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconAndText(
                                      icon: Icons.circle,
                                      text: 'Normal',
                                      color: AppColors.smallTextColor,
                                      iconColor: AppColors.iconColor1),
                                  IconAndText(
                                    icon: Icons.pin_drop_outlined,
                                    text: '1.7 km',
                                    color: AppColors.smallTextColor,
                                    iconColor: AppColors.iconColor2,
                                  ),
                                  IconAndText(
                                      icon: Icons.watch_later_outlined,
                                      text: '32 min',
                                      color: AppColors.smallTextColor,
                                      iconColor: AppColors.iconColor3)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget _buildFoodPageBody(int index) {
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
}
