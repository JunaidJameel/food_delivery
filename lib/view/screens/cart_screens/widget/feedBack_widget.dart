import 'package:design/controller/cart_controller.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FeedBackWidget extends StatelessWidget {
  FeedBackWidget({
    super.key,
  });
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Feedback',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsOfApp.mediumGreyColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Agora',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                RatingBar.builder(
                  itemSize: 25,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            TextFieldWidget(
              hintText: 'Write a review',
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  letterSpacing: 0.5,
                  fontSize: 12,
                  color: ColorsOfApp.mediumGreyColor),
              contentPadding:
                  const EdgeInsets.only(left: 15, top: 15, right: 15),
              textfiledColor: const Color.fromARGB(255, 241, 251, 246),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(12)),
              maxLines: 5,
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            ButtonWidget(
              ontap: () {
                Get.back();

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      content: SizedBox(
                        height: s.height * 0.2,
                        width: s.width,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/tick.png',
                              height: s.height * 0.07,
                            ),
                            SizedBox(
                              height: s.height * 0.02,
                            ),
                            Text(
                              'Thanks for your feedback',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorsOfApp.blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: s.height * 0.01,
                            ),
                            Text(
                              "Your feedback w'll help improve ourself",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorsOfApp.mediumGreyColor,
                                      fontSize: 13),
                            ),
                            SizedBox(
                              height: s.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              buttonTxt: 'Publish Your Feedback',
            ),
            SizedBox(
              height: s.height * .03,
            )
          ],
        ),
      ),
    );
  }
}
