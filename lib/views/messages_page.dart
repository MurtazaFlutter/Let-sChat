import 'package:lets_chat/utils/exports.dart';
import 'package:lets_chat/widgets/chat_room.dart';

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

  late final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Test User"),
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
              Expanded(
                  child: CustomTextField(
                controller: _messagesController,
                hintText: 'Write your message',
              )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                    color: AppColor.primary,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView.builder(itemBuilder: (context, index) {
          return const ChatRoom();
        }),
      ),
    );
  }
}
