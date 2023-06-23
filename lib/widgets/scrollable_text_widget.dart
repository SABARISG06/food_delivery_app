import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ScrollableText extends StatefulWidget {
  const ScrollableText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<ScrollableText> createState() => _ScrollableTextState();
}

class _ScrollableTextState extends State<ScrollableText> {
  late String firstHalf;
  late String secondHalf;
  bool isHiddenText = true;

  double textHeight = Dimension.screenHeight / 5.56; //* height is 160
  @override
  void initState() {
    super.initState();
    //? if given textHeight more than overheight it will goes on..
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      // print(textHeight);
      secondHalf = widget.text.substring(textHeight.toInt() + 1);
      // print(widget.text.length);
    } else {
      secondHalf = '';
      firstHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              height: 1.8,
              size: 16,
            )
          : Column(
              children: [
                SmallText(
                  text: isHiddenText
                      ? ('$firstHalf ....')
                      : (firstHalf + secondHalf),
                  height: 1.8,
                  size: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isHiddenText = !isHiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      isHiddenText
                          ? const SmallText(
                              text: 'Show more',
                              color: AppColors.mainColor,
                            )
                          : const SmallText(
                              text: 'Show less',
                              color: AppColors.mainColor,
                            ),
                      Icon(
                        isHiddenText
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
