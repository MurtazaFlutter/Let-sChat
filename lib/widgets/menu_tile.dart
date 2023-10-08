import '../utils/exports.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.secondary),
              child: const Icon(Icons.dark_mode)),
          title: const Text("Appearance"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
