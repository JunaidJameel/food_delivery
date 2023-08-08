import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/main_screens/inbox_screen/widget/chat_widget.dart';
import 'package:design/view/screens/main_screens/inbox_screen/widget/notifications_widget.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Image.asset(
                Images.searchIcon,
                height: s.height * 0.03,
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Inbox',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 2, // Number of tabs (Notifications and Chat)
          child: Column(
            children: [
              SizedBox(
                height: s.height * 0.02,
              ),
              const CustomDividerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TabBar(
                  labelColor: ColorsOfApp.appColor,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorsOfApp.appColor,
                  tabs: const [
                    Tab(
                      text: "Notifications",
                    ),
                    Tab(text: "Chat"),
                  ],
                ),
              ),
              const CustomDividerWidget(),
              Expanded(
                child: TabBarView(
                  children: [
                    const NotificationsWidget(),
                    ChatWidget(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
