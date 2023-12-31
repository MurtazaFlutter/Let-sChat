import 'package:lets_chat/utils/exports.dart';
import 'package:lets_chat/views/messages/widgets/chat_room.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late TextEditingController _messagesController;
  @override
  void initState() {
    _messagesController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messagesController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello',
      'isMyMessage': true,
    },
    {
      'text': 'Hi there!',
      'isMyMessage': false,
    },
    {
      'text': 'Hello',
      'isMyMessage': true,
    },
    {
      'text': 'Hi there!',
      'isMyMessage': false,
    },
    {
      'text': 'Hello',
      'isMyMessage': true,
    },
    {
      'text': 'Hi there!',
      'isMyMessage': false,
    },
  ];

  late final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          "Test User",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.only(right: 15),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: AppColor.primary,
                  )),
              // Expanded(
              //     child: CustomTextField(
              //   controller: _messagesController,
              //   hintText: 'Write your message',
              // )),
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.send_rounded,
              //       color: AppColor.primary,
              //     ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60, top: 15),
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isMyMessage = message['isMyMessage'] ?? false;
              return ChatRoom(
                isMyMessages: isMyMessage,
              );
            }),
      ),
    );
  }
}
