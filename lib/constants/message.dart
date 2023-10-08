class Message {
  Chat? chat;
  Item? item;
  Result? result;
  DateTime createdAt;

  Message({
    this.chat,
    this.item,
    this.result,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        chat: Chat.fromJson(json["chat"]),
        item: Item.fromJson(json["item"]),
        result: Result.fromJson(json["result"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "chat": chat!.toJson(),
        "item": item!.toJson(),
        "result": result!.toJson(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Chat {
  int id;
  bool isSentByMe;
  DateTime createdAt;
  String message;

  Chat({
    required this.id,
    required this.isSentByMe,
    required this.createdAt,
    required this.message,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        isSentByMe: json["isSentByMe"],
        createdAt: DateTime.parse(json["createdAt"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isSentByMe": isSentByMe,
        "createdAt": createdAt.toIso8601String(),
        "message": message,
      };
}

class Item {
  int id;
  String name;
  String image;
  bool isSentByMe;
  DateTime createdAt;

  Item({
    required this.id,
    required this.name,
    required this.image,
    required this.isSentByMe,
    required this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isSentByMe: json["isSentByMe"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "isSentByMe": isSentByMe,
        "createdAt": createdAt.toIso8601String(),
      };
}

class Result {
  String image;
  DateTime createdAt;

  Result({
    required this.image,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "createdAt": createdAt.toIso8601String(),
      };
}

List<Message> messageDummy = [
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 1,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message: "Hello, good afternoon Aurel!",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 3,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message: "I'm Doctor Carly, how can I help you? What is your complaint?",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 4,
      isSentByMe: true,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message:
          "Hi, Doctor Carly! I want to ask, these days my skin is very sensitive with the appearance of wet and red pimples... What do you think is the cause? and how to cure it?",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 5,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message:
          "Have you ever done a test and the result is that your skin is an oily skin type, right? So it needs more care and diligent to clean the face.",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 6,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message: "Are you trying a new beauty product?",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 7,
      isSentByMe: true,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message: "Not. I am also a basketball player",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 8,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message:
          "Then you need to take some care to keep your skin protected from exposure to dust and UV rays which can make your skin reduce acne and oil.",
    ),
  ),
  Message(
    createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
    chat: Chat(
      id: 9,
      isSentByMe: false,
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      message:
          "<bold>1.Use sunblock</bold>\n<dot/>If not protected with sun block, their skin becomes vulnerable to skin diseases, such as premature skin aging, uneven skin tone, and skin cancer.\n<bold>2. Aloe vera drink</bold>\n<dot/>Aloe vera banyak mengandung vitamin C dan B, serta elektrolit, sehingga mampu menjaga hidrasi dan kelembapan kulit.  Kandungan asam aminonya juga dapat melawan inflamasi dan bakteri.\n<bold>3. Use body lotion</bold>\n<dot/>Body lotion dilengkapi dengan serum dan vitamin B mampu melembapkan kulit.\n<bold>4. Use face wash</bold>\n<dot/>Every time you exercise or take a shower, you must wash your face with a special facial soap.",
    ),
  ),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 10,
        isSentByMe: true,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "Okay doc",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 11,
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "Do you already have a product for treatment?",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 12,
        isSentByMe: true,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "no doctor yet",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 13,
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message:
            "Ok, I will suggest you to try some products from Wardah to take care of your skin\n1.Wardah Seaweed Balancing Facial Wash\n<dot/>This face wash is able to remove dead skin cells without stripping the skin of moisture, suitable for sensitive, oily, and acne-prone skin\n2. WARDAH UV Shield Sunscreen Gel\n<dot/>Sble to protect the skin from Harmful UV Rays with the power of SPF30 PA+++, able to even out skin tone which is suitable for all skin types.\n3. Wardah Nature Daily Witch Hazel Purifying Moisturizer Gel\n<dot/>The content of Witch Hazel extract is able to help moisturize as well as narrow the skin pores.\n4. Wardah Acnederm Acne Spot Treatment Gel\n<dot/>This acne spot treatment combines active ingredients that can soothe facial skin due to bacterial irritation. The content of willowherb extract is also able to protect the skin from acne-causing bacteria.",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      item: Item(
        id: 1,
        name: "Wardah Seaweed Balancing Facial Wash",
        image:
            "https://images.tokopedia.net/img/JFrBQq/2022/8/19/6c90f583-d469-4cce-89bc-014fa1ffa60a.jpg",
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      item: Item(
        id: 2,
        name: "WARDAH UV Shield Sunscreen Gel",
        image:
            "https://images.tokopedia.net/img/JFrBQq/2022/8/19/6c90f583-d469-4cce-89bc-014fa1ffa60a.jpg",
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      item: Item(
        id: 3,
        name: "Wardah Nature Daily Witch Hazel Purifying Moist ",
        image:
            "https://images.tokopedia.net/img/JFrBQq/2022/8/19/6c90f583-d469-4cce-89bc-014fa1ffa60a.jpg",
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      item: Item(
        id: 4,
        name: "Wardah Acnederm Acne Spot Teatment G",
        image:
            "https://images.tokopedia.net/img/JFrBQq/2022/8/19/6c90f583-d469-4cce-89bc-014fa1ffa60a.jpg",
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 14,
        isSentByMe: true,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message:
            "Thank you doctor for the explanation and product suggestions provided",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 15,
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "OK, is there anything else you'd like to ask Aurel?",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 16,
        isSentByMe: true,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "So far, enough doctor",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 17,
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message:
            "Ok Aurel, thank you to choose me to be your consulting doctor. I hope that the advice I have given can be useful... If you have any further questions, you can consult again... Good morning, have a nice day Ana! stay healthy...",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 17,
        isSentByMe: false,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "Can i end the chat?",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      chat: Chat(
        id: 18,
        isSentByMe: true,
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
        message: "Yes, doc",
      )),
  Message(
      createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      result: Result(
        image: "assets/images/doctor5.jpg",
        createdAt: DateTime.parse("2023-10-08 08:58:52.418"),
      ))
];
