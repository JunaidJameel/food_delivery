import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => TimelineTile(
          alignment: TimelineAlign.manual,
          isFirst: index == 0 ? true : false,
          isLast: index == 3 ? true : false,
          lineXY: 0.05,
          beforeLineStyle: const LineStyle(
            color: ColorsOfApp.textFieldgreyColor, // Color of the line
            thickness: 1, // Thickness of the line
          ),
          afterLineStyle: const LineStyle(
            color: ColorsOfApp.textFieldgreyColor, // // Color of the line
            thickness: 1, // Thickness of the line
          ),
          indicatorStyle: IndicatorStyle(
            width: 46,
            height: 45,
            indicator: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: index == 0 || index == 1
                    ? ColorsOfApp.appColor
                    : const Color.fromARGB(255, 240, 240, 240),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: index == 0 || index == 1
                    ? Image.asset(
                        Images.check,
                        color: Colors.white,
                      )
                    : index == 2
                        ? const Icon(
                            Icons.delivery_dining,
                            color: ColorsOfApp.mediumGreyColor,
                          )
                        : const Icon(
                            Icons.door_back_door_outlined,
                            color: ColorsOfApp.mediumGreyColor,
                          ),
              ),
            ),
          ),
          endChild: ListTile(
            title: Text(
              'In Process',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Open your door!',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: ColorsOfApp.mediumGreyColor,
                  fontSize: 10),
            ),
            trailing: Text(
              index == 0 || index == 1 ? '11: 32' : '....',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
