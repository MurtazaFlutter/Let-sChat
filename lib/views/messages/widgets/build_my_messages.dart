import '../../../utils/app_util.dart';
import '../../../utils/exports.dart';

class BuildMyMessage extends StatelessWidget {
  const BuildMyMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Test user",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const Gap(5),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'this is a test message',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, height: 1.5)),
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
