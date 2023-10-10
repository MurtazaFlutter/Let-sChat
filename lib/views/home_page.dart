import 'package:carousel_slider/carousel_slider.dart';
import 'package:lets_chat/utils/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/icons/chat.png"),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Stories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(1, 1))
                                ],
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/icons/chat.png"),
                                    ),
                                    Text('John'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Gap(20),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Groups",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primary),
                                ),
                                Icon(
                                  Icons.play_arrow,
                                  color: AppColor.primary,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Gap(20),
                    ],
                  ),
                  const GroupSlider()
                ],
              )
            ],
          ),
        ));
  }
}

class GroupSlider extends StatefulWidget {
  const GroupSlider({Key? key}) : super(key: key);

  @override
  _GroupSliderState createState() => _GroupSliderState();
}

class _GroupSliderState extends State<GroupSlider> {
  final List<String> groups = [
    'Flutter \nCommunity',
    'React Native \nDevelopers',
    'iOS Developers',
    'Android \nDevelopers',
    'Web \nDevelopers',
  ];

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              // onPageChanged: controller.onCardSlided,
            ),
            itemCount: 10,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/icons/chat.png'),
                          ),
                          title: const Text("John same"),
                          subtitle: const Text("here is my message"),
                          trailing: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.remove_red_eye, size: 10),
                                  Text('1 min'),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: const Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                        // child:
                        // const Padding(
                        //   padding: EdgeInsets.all(5),
                        //   child: Row(
                        //     children: [
                        //       CircleAvatar(
                        //         radius: 20,
                        //         backgroundImage:
                        //             AssetImage('assetsiconschat.png'),
                        //       ),
                        //       Column(
                        //         children: [

                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
