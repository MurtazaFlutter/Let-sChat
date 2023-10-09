import 'package:lets_chat/utils/exports.dart';
import '../../../utils/app_util.dart';

class BuildOtherMessage extends StatelessWidget {
  const BuildOtherMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/chat.png",
          height: 40,
          width: 40,
        ),
        const Gap(5),
        Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade50,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Test other user",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const Gap(5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'this is a other test message',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                const TextSpan(text: ""),
                TextSpan(
                    text: AppUtil.getTimeAgo(
                      DateTime.now(),
                    ),
                    style: const TextStyle(fontSize: 13, color: Colors.grey))
              ]))
            ],
          ),
        )
      ],
    );
  }
}
