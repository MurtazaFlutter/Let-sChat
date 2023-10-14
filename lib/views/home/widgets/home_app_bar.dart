import '../../../utils/exports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ghulam Murtaza",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            "Let's reach your friends!",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AppUtil().appIcon),
          ),
        )
      ],
    );
  }
}
