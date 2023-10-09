import 'package:lets_chat/views/messages/widgets/build_other_messages.dart';
import '../../../utils/exports.dart';
import 'build_my_messages.dart';

class ChatRoom extends StatelessWidget {
  final bool isMyMessages;
  const ChatRoom({
    super.key,
    required this.isMyMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: isMyMessages ? const BuildMyMessage() : const BuildOtherMessage(),
    );
  }
}
