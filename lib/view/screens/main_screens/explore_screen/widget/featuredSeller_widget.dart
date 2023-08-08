import 'package:design/data/model/featuredSeller_model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class FeaturedSellerWidget extends StatelessWidget {
  const FeaturedSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Column(
        children: [
          SizedBox(
            height: s.height * 0.01,
          ),
          Row(
            children: [
              Text(
                'Featured Seller',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: ColorsOfApp.greyColor,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const CircleAvatar(
                radius: 10,
                backgroundColor: ColorsOfApp.appColor,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 21,
                ),
              ),
            ],
          ),
          SizedBox(
              height: s.height * 0.135,
              child: ListView.builder(
                itemCount: FeaturedSellerMode.featuredSellerList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = FeaturedSellerMode.featuredSellerList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        Container(
                          height: s.height * 0.1,
                          width: s.width * 0.17,
                          decoration: BoxDecoration(
                            color: item.circleColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(item.chiefImg),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.01,
                        ),
                        Text(
                          item.chiefName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              )),
          SizedBox(
            height: s.height * 0.02,
          ),
        ],
      ),
    );
  }
}
