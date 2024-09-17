import 'package:flutter/material.dart';
import 'package:colorful_effects/common/color_extension.dart';
import 'package:colorful_effects/common_widget/round_button.dart';

import 'change_address_view.dart';
import 'checkout_message_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  List paymentArr = [
    {"name": "Cash on delivery", "icon": "assets/img/cash.png"},
    {"name": "**** **** **** 2187", "icon": "assets/img/visa_icon.png"},
  ];

  int selectMethod = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        "پرداخت",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ادرس ارسال",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "کابل",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const ChangeAddressView()),
                        //     );
                        //   },
                        //   // child: Text(
                        //   //   "Change",
                        //   //   textAlign: TextAlign.center,
                        //   //   style: TextStyle(
                        //   //       color: TColor.primary,
                        //   //       fontSize: 13,
                        //   //       fontWeight: FontWeight.w700),
                        //   // ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColor.textfield),
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "طریقه پرداخت",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: TColor.primary),
                          label: Text(
                            "افزودن کارت",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: paymentArr.length,
                        itemBuilder: (context, index) {
                          var pObj = paymentArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                                color: TColor.textfield,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        TColor.secondaryText.withOpacity(0.2))),
                            child: Row(
                              children: [
                                Image.asset(pObj["icon"].toString(),
                                    width: 50, height: 20, fit: BoxFit.contain),
                                // const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    pObj["name"],
                                    style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectMethod = index;
                                    });
                                  },
                                  child: Icon(
                                    selectMethod == index
                                        ? Icons.radio_button_on
                                        : Icons.radio_button_off,
                                    color: TColor.primary,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColor.textfield),
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "زیر مجموع",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "AFN 8600",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "هزینه انتقال",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "AFN 50",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "تخفیف",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "-ندارد",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "مجموع",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "8650",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColor.textfield),
                height: 8,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: RoundButton(
                    title: "خرید",
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return const CheckoutMessageView();
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
