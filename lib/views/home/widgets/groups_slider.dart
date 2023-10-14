import 'package:carousel_slider/carousel_slider.dart';
import 'package:lets_chat/views/home/widgets/groups.dart';
import '../../../controllers/groups_slider.dart';
import '../../../utils/exports.dart';

class GroupsSlider extends StatelessWidget {
  const GroupsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> carouselItems =
        List.generate(5, (index) => const Groups());

    return Column(
      children: [
        Consumer<GroupsSliderController>(builder: (context, slider, child) {
          return SizedBox(
            height: 250,
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                initialPage: slider.currentIndex,
                onPageChanged: (index, reason) {
                  slider.setIndex(index);
                },
              ),
              items: carouselItems,
            ),
          );
        }),
      ],
    );
  }
}
