import 'package:flutter/material.dart';
import 'package:colorful_effects/common/color_extension.dart';
import 'package:colorful_effects/common_widget/round_textfield.dart';

import '../../common/globs.dart';
import '../../common/service_call.dart';
import '../../common_widget/category_cell.dart';
import '../../common_widget/most_popular_cell.dart';
import '../../common_widget/popular_resutaurant_row.dart';
import '../../common_widget/recent_item_row.dart';
import '../../common_widget/view_all_title_row.dart';
import '../more/my_order_view.dart';
import '.././menu/new/menu_new_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  List catArr = [
    {"image": "assets/img/pencildrawing.jpg", "name": "پنسل"},
    {"image": "assets/img/pendrawing.jpg", "name": " قلم رنگی"},
    {"image": "assets/img/abramg.jpg", "name": "آبرنگ"},
    {"image": "assets/img/landscape.jpg", "name": "رنگی"},
  ];

  List popArr = [
    {
      "image": "assets/img/painting.jpg",
      "name": "راه بی پایان",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting2.jpg",
      "name": "مسیر غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting3.jpg",
      "name": "مسافر",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    }
  ];

  List mostPopArr = [
    {
      "image": "assets/img/painting4.jpg",
      "name": "مسیر غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting5.jpg",
      "name": "عشق بی فرجام",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting4.jpg",
      "name": "مسیر غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting5.jpg",
      "name": "عشق بی فرجام",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting6.jpg.jpg",
      "name": "میان راه",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting6.jpg.jpg",
      "name": "میان راه",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
  ];

  List recentArr = [
    {
      "image": "assets/img/painting3.jpg",
      "name": "میان راه",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting.jpg",
      "name": "میان راه",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "rate": "4.9",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Text(
                      " گالری جلوه های رنگین",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Delivering to",
              //         style:
              //             TextStyle(color: TColor.secondaryText, fontSize: 11),
              //       ),
              //       const SizedBox(
              //         height: 6,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Current Location",
              //             style: TextStyle(
              //                 color: TColor.secondaryText,
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w700),
              //           ),
              //           const SizedBox(
              //             width: 25,
              //           ),
              //           Image.asset(
              //             "assets/img/dropdown.png",
              //             width: 12,
              //             height: 12,
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: RoundTextfield(
              //     hintText: "Search Food",
              //     controller: txtSearch,
              //     left: Container(
              //       alignment: Alignment.center,
              //       width: 30,
              //       child: Image.asset(
              //         "assets/img/search.png",
              //         width: 20,
              //         height: 20,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(
                      cObj: cObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(title: "جدیدترین ها", onView: () {}),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: ((context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {},
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "روغن رنگی",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "پنسل ساده",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: ((context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(
                    rObj: rObj,
                    onTap: () {},
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
