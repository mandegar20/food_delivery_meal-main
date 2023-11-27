import 'package:flutter/material.dart';
import 'package:colorful_effects/common/color_extension.dart';
import 'package:colorful_effects/common_widget/round_textfield.dart';

import '../../../../common_widget/menu_item_row.dart';
import '../../more/my_order_view.dart';
import 'item_details_view.dart';

class MenuNewView extends StatefulWidget {
  final Map mObj;
  const MenuNewView({super.key, required this.mObj});

  @override
  State<MenuNewView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuNewView> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/img/painting4.jpg",
      "name": "مسیر غروب",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting5.jpg",
      "name": "فرجام",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting3.jpg",
      "name": "میان راه",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting.jpg",
      "name": "میان راه",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "price": "4900",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting4.jpg",
      "name": "مسیر غروب",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting5.jpg",
      "name": "عشق بی فرجام",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting6.jpg.jpg",
      "name": "میان راه",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting7.jpg",
      "name": "غروب",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting8.jpg",
      "name": "راه بی پایان",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "عبدلواحد علیار"
    },
    {
      "image": "assets/img/painting6.jpg.jpg",
      "name": "میان راه",
      "price": "3500",
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
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        widget.mObj["name"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "جستجو",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ItemDetailsView()),
                        //this should discussed deeply
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
