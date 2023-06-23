import 'package:flutter/material.dart';

import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/backi_cardi.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/food_details_columnwidets.dart';
import 'package:food_delivery_app/widgets/scrollable_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //!background-image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimension.imageContainer,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/2.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //!Icons
          Positioned(
            top: Dimension.widthLR55,
            right: Dimension.widthLR20,
            left: Dimension.widthLR20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackIandCardI(
                  icon: Icons.arrow_back_ios,
                ),
                BackIandCardI(
                  icon: Icons.shopping_cart,
                ),
              ],
            ),
          ),
          //!BottomSheet
          Positioned(
            top: Dimension.imageContainer - 20,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimension.widthLR20,
                right: Dimension.widthLR20,
                top: Dimension.heightTB15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius20),
                  topRight: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              //* Details page about the food
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FoodDetails(),
                  SizedBox(
                    height: Dimension.sizedBoxheight20,
                  ),
                  const BigText(
                    text: 'Introduce',
                    color: Colors.black,
                  ),
                  //!Scrollable-Text
                  SizedBox(
                    height: Dimension.sizedBoxheight10,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ScrollableText(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //!BottomNavigation Details
      bottomNavigationBar: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.all(0),
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimension.radius20 * 2),
              topLeft: Radius.circular(Dimension.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //? increment and decrement.
              Container(
                margin: EdgeInsets.all(Dimension.widthLR20),
                padding: EdgeInsets.all(Dimension.widthLR20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: Colors.white54),
                child: Row(
                  children: [
                    const Icon(Icons.remove),
                    SizedBox(
                      width: Dimension.sizedBoxwidth10 - 5,
                    ),
                    const BigText(
                      text: '0',
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: Dimension.sizedBoxwidth10 - 5,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 70,
                margin: EdgeInsets.all(Dimension.widthLR20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 107, 255, 220),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                    ),
                  ),
                  onPressed: () {},
                  child: const SmallText(
                    text: 'Rs. 150',
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
