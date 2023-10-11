import 'package:carousel_slider/carousel_slider.dart';
import 'package:lets_chat/views/home/widgets/groups.dart';
import '../../../utils/exports.dart';

class GroupsSlider extends StatefulWidget {
  const GroupsSlider({super.key});

  @override
  GroupsSliderState createState() => GroupsSliderState();
}

class GroupsSliderState extends State<GroupsSlider> {
  int _currentIndex = 0;
  final List<Widget> _carouselItems =
      List.generate(5, (index) => const Groups());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              viewportFraction: 0.7,
              enlargeCenterPage: true,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _carouselItems,
          ),
        ),
      ],
    );
  }
}
