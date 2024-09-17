import 'package:flutter/material.dart';
import 'package:colorful_effects/common/color_extension.dart';
import 'package:colorful_effects/common_widget/round_button.dart';
import 'package:colorful_effects/common_widget/square_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/square_textfield.dart';
import '../../common_widget/popular_resutaurant_row.dart';
import '../more/my_order_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/globs.dart';
import 'package:colorful_effects/common/extension.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

TextEditingController txtName = TextEditingController();
TextEditingController txtEmail = TextEditingController();
TextEditingController txtMobile = TextEditingController();
TextEditingController txtAddress = TextEditingController();
TextEditingController txtPassword = TextEditingController();
TextEditingController txtConfirmPassword = TextEditingController();

class _OfferViewState extends State<OfferView> {
  TextEditingController txtSearch = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  List offerArr = [
    {
      "image": "assets/img/painting4.jpg",
      "name": "مسیر غروب",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "ظریف شریفی"
    },
    {
      "image": "assets/img/painting5.jpg",
      "name": "فرجام",
      "price": "3500",
      "rating": "124",
      "type": "کاک",
      "artist": "ظریف شریفی"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "فرمایش ها",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "برای فرمایش نقاشی عکس خودتان را\n اپلود نمایید",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: SizedBox(
              //     width: 140,
              //     height: 30,
              //     child: RoundButton(
              //         title: "بررسی فرمایشات", fontSize: 12, onPressed: () {}),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "اسم",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: RoundTitleTextfield(
                  // title: "نام",
                  hintText: "اسم",
                  controller: txtName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "شماره تماس",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: RoundTitleTextfield(
                  // title: "شماره تماس",
                  hintText: "شماره تماس",
                  controller: txtMobile,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "آدرس",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: RoundTitleTextfield(
                  // title: "آدرس",
                  hintText: "آدرس",
                  controller: txtAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "ابعاد تابلو طول",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: RoundTitleTextfield(
                  // title: "شماره تماس",
                  hintText: "25 سانتی متر",
                  controller: txtMobile,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "ابعاد تابلو عرض",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: RoundTitleTextfield(
                  // title: "شماره تماس",
                  hintText: "25 سانتی متر",
                  controller: txtMobile,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "انتخاب عکس جهت بررسی",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SquareButton(
                    title: "انتخاب عکس",
                    onPressed: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    }),
              ),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "توضیحات",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.black, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SquareTitleTextfield(
                  // title: "شماره تماس",
                  hintText: "توضیحات شما درباره نقاشی",
                  controller: txtMobile,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundButton(
                    title: "ثبت درخواست",
                    onPressed: () {
                      mdShowAlert(Globs.appName, MSG.order, () {});
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              // ListView.builder(

              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: offerArr.length,
              //   itemBuilder: ((context, index) {
              //     var pObj = offerArr[index] as Map? ?? {};
              //     return PopularRestaurantRow(
              //       pObj: pObj,
              //       onTap: () {},
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
