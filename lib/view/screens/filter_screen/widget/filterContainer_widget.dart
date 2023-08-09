import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/main_screens/explore_screen/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterContainerWidget extends StatefulWidget {
  FilterContainerWidget({super.key});

  @override
  State<FilterContainerWidget> createState() => _FilterContainerWidgetState();
}

class _FilterContainerWidgetState extends State<FilterContainerWidget> {
  int initialTap = 0;
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return SizedBox(
      height: s.height * 0.4,
      width: s.width,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: StaticLists.containerDataList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              initialTap = index;
            });
            Future.delayed(const Duration(seconds: 2), () {
              const Duration(milliseconds: 500);
              Get.off(
                ExploreScreen(),
              );
            });
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: s.height * 0.15,
                  width: s.width * 0.915,
                  decoration: BoxDecoration(
                    border: Border.all(
                        // color: initialTap == index
                        //     ? filterTap == false
                        //         ? ColorsOfApp.appColor
                        //         : Colors.transparent
                        //     : con.filterTap == true
                        //         ? ColorsOfApp.appColor
                        //         : Colors.transparent,
                        ),
                    borderRadius: BorderRadius.circular(10),
                    // color: authController.initialTap.value == index
                    //     ? con.filterTap == false
                    //         ? ColorsOfApp.containerLightBlueColor
                    //         : ColorsOfApp.containerlightGreyColor
                    //     : con.filterTap == true
                    //         ? ColorsOfApp.containerLightBlueColor
                    //         : ColorsOfApp.containerlightGreyColor,
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset(
                        StaticLists.containerDataList[index]['img'],
                        height: s.height * 0.06,
                        color: ColorsOfApp.appColor,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        StaticLists.containerDataList[index]['title'],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            color: ColorsOfApp.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          'Lorem ipsum doior sit amet, adipiscing\nedit.Nulla at euismad lorem.',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: ColorsOfApp.greyColor,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              initialTap == index
                  ? Positioned(
                      left: s.width * 0.87,
                      child: CircleAvatar(
                        backgroundColor: ColorsOfApp.appColor,
                        radius: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            Images.check,
                            color: ColorsOfApp.appScaffoldColor,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
