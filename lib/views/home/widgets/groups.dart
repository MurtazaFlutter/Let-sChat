import '../../../utils/exports.dart';

class Groups extends StatelessWidget {
  const Groups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Flutter \nCommunity",
                      style: TextStyle(
                          fontSize: 30,
                          height: 0,
                          letterSpacing: 0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/icons/chat.png'),
                      ),
                      title: Text("Murtaza"),
                      subtitle: Text(
                        "This is dummy message real data will come soon",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      trailing: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
