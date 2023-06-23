import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/backi_cardi.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/scrollable_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class SilverFoodDetails extends StatelessWidget {
  const SilverFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //* customised appBar
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackIandCardI(icon: Icons.close),
                BackIandCardI(icon: Icons.shopping_cart),
              ],
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 59, 232, 255),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/1.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            //* Header of the title
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: SizedBox(
                height: Dimension.sizedBoxheight20 * 2,
                width: double.maxFinite,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius20),
                      topRight: Radius.circular(Dimension.radius20),
                    ),
                  ),
                  child: Center(
                    child: BigText(
                        text: 'Heading of the Food',
                        color: Colors.black,
                        size: Dimension.font20),
                  ),
                ),
              ),
            ),
          ),
          //* Body of the appBar
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!Scrollable-Text
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimension.widthLR10, right: Dimension.widthLR10),
                  child: const ScrollableText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Dimension.widthLR55,
                right: Dimension.widthLR55,
                top: Dimension.heightTB10,
                bottom: Dimension.heightTB10),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BackIandCardI(
                    icon: Icons.remove,
                    bgColor: AppColors.mainColor,
                    size: 45,
                  ),
                  BigText(
                    text: 'Rs. 150 * 0',
                    color: Colors.black,
                    size: 25,
                  ),
                  BackIandCardI(
                    icon: Icons.add,
                    bgColor: AppColors.mainColor,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          //!Bottom curve things..
          SizedBox(
            height: 130,
            child: Card(
              margin: const EdgeInsets.all(0),
              color: const Color.fromARGB(255, 120, 151, 166),
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
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.tealAccent,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 70,
                    margin: EdgeInsets.all(Dimension.widthLR20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
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
        ],
      ),
    );
  }
}
