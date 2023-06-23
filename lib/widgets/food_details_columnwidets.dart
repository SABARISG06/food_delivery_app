import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BigText(
          text: 'Pastry Side',
          color: Colors.black,
        ),
        SizedBox(
          height: Dimension.sizedBoxheight10,
        ),
        Row(
          children: [
            //* Wrap widget is also multi child widget
            //* But here itself replace a our custom list generator to create a icon
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  size: 15,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            SizedBox(
              width: Dimension.sizedBoxheight10,
            ),
            const SmallText(
              text: '4.6',
              color: AppColors.smallTextColor,
            ),
            SizedBox(
              width: Dimension.widthLR10,
            ),
            const SmallText(
              text: '1000  comments',
              color: AppColors.smallTextColor,
            ),
          ],
        ),
        SizedBox(
          height: Dimension.sizedBoxheight20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
