import 'package:design/controller/inboxScreen_controller.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key});
  InboxController inboxController = Get.put(InboxController());
  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: s.height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 26, 26),
                borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Messages and calls are end-to-end encrypted.\n  No one outside of the chat,not even ChitChat,\n   can read or listen to them.Tap to learn more.',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 223, 128),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: s.height * 0.03),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                itemCount: inboxController.messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: s.width * 0.6,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(202, 39, 180, 93),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Flexible(
                              child: Text(
                                inboxController.messages[index],
                                style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFieldWidget(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10, left: 20),
                enabledBorder: InputBorder.none,
                hintTextColor: ColorsOfApp.mediumGreyColor,
                // inputBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                textfiledColor: const Color.fromARGB(255, 232, 232, 232),
                hintText: 'Type a message',
                controller: messageController,
                suffixIcon: IconButton(
                  onPressed: () {
                    inboxController.sendMessage(
                        messageController.text, messageController);
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.02,
          ),
        ],
      ),
    );
  }
}
