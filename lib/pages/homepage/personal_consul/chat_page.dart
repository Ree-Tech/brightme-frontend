import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/message.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:styled_text/styled_text.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: darGreykColor,
              size: 24,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call_outlined,
                color: purpleColor,
                size: 24,
              ))
        ],
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/doctor6.jpg",
              ),
              radius: 15,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Carly Ely, Sp.DV",
                  style: semiBold(
                    sizeFont: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Online",
                  style: reguler(
                    colorFont: purpleColor,
                    sizeFont: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xffF8F8F8),
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                groupHeaderBuilder: (Message message) => const Center(
                  child: Center(
                    child: Text("Today"),
                  ),
                ),
                reverse: true,
                order: GroupedListOrder.DESC,
                floatingHeader: true,
                elements: messageDummy,
                groupBy: (message) => DateTime(
                  message.createdAt.day,
                ),
                itemBuilder: (context, Message message) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: chatBuilder(message)),
              ),
            ),
          ),
          Container(
            height: 81,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: boxShadow,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.mic_none_outlined,
                      color: purpleColor,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "write message here",
                            hintStyle: reguler(
                              colorFont: greyColor,
                              sizeFont: 12,
                            )),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: purpleColor,
                      size: 24,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Icon(
                      Icons.sentiment_satisfied_alt,
                      color: purpleColor,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget chatBuilder(Message data) {
    if (data.result != null) {
      return resultChat(data);
    } else if (data.item != null) {
      return itemBuilder(
        data.item!.image,
        data.item!.name,
      );
    }

    return ChatBubble(
        margin: data.chat!.isSentByMe
            ? EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.3)
            : EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.3),
        clipper: data.chat!.isSentByMe
            ? ChatBubbleClipper6(type: BubbleType.sendBubble)
            : ChatBubbleClipper6(type: BubbleType.receiverBubble),
        backGroundColor: data.chat!.isSentByMe ? purpleColor : lightWhite,
        alignment:
            data.chat!.isSentByMe ? Alignment.topRight : Alignment.topLeft,
        child: StyledText(
          text: data.chat!.message,
          style: data.chat!.isSentByMe
              ? reguler(sizeFont: 12, colorFont: lightWhite)
              : reguler(sizeFont: 12, colorFont: purpleColor),
          tags: {
            'bold': StyledTextTag(
                style: semiBold(
              colorFont: purpleColor,
              sizeFont: 12,
            )),
            'dot': StyledTextIconTag(
              Icons.fiber_manual_record,
              color: purpleColor,
              size: 9,
            ),
          },
        ));
  }

  Widget itemBuilder(
    String image,
    String name,
  ) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
          child: SizedBox(
            width: 90,
            height: 120,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 140,
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24)),
            color: lightWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: medium(
                    colorFont: blackColor,
                    sizeFont: 12,
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: CustomButton(
                    onPressed: () {},
                    buttonText: "Buy",
                    heightButton: 30,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget resultChat(Message data) {
    return SizedBox(
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(data.result!.image),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, rateDoctorRoute),
            child: Container(
              height: 48,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56), color: lightPuprle),
              child: Center(
                child: Text(
                  "Rate this consultation",
                  style: semiBold(
                    colorFont: purpleColor,
                    sizeFont: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 64,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
              color: middleGrey,
            ),
            child: Center(
              child: Text(
                "This consultation is over. Still have questions? Let's consult again",
                style: semiBold(
                  colorFont: purpleColor,
                  sizeFont: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
