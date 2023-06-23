import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home/page_builder_caursoul.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // print('width ${MediaQuery.of(context).size.width}');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              //!Top-Section
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimension.heightTB10, bottom: Dimension.heightTB15),
                padding: EdgeInsets.only(
                    left: Dimension.widthLR20, right: Dimension.widthLR20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const BigText(text: 'Chennai'),
                        Row(
                          children: const [
                            SmallText(
                              text: 'Choolaimedu',
                              color: AppColors.smallTextColor,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.smallTextColor,
                              size: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: Dimension.container45,
                      height: Dimension.container45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimension.icon24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(child: FoodCaursoul()),
            ),
          ],
        ),
      ),
    );
  }
}
