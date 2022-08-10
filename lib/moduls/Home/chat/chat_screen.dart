import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/theme_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kChatController.messagesApiCall({},() {});
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        /*appBar: commonAppBar(
            leadingIcon: const SizedBox(),
            titleWidget: Text(
              'Chats',
              style: FontStyleUtility.blackInter20W600,
            ),
            elevation: 0.5,
            actionWidgets: [
              IconButton(
                  onPressed: () {
                    print('edit click');
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: colorBlack,
                  ))
            ]),*/
        child: Column(
          children: [
            30.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    size: 30,
                  ),
                  10.widthBox,
                  Text(
                    'Chats',
                    style: greyInter18W500.copyWith(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            5.heightBox,
            StreamBuilder<Object>(
                stream: isDarkOn.stream,
                builder: (context, snapshot) {
                  return Text(
                    'You don\'t have any chat',
                    style: greyInter18W500.copyWith(
                        color: isDarkOn.value == true
                            ? colorWhite.withOpacity(0.7)
                            : colorDarkBlue.withOpacity(0.7),
                        letterSpacing: 1),
                    textAlign: TextAlign.center,
                  );
                }),
            30.heightBox,
          ],
        ));
  }
}
