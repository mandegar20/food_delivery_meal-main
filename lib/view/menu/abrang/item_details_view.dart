import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:colorful_effects/common_widget/round_icon_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../common/color_extension.dart';
import '../../more/my_order_view.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key, required this.data});

  final Map data;

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class Order {
  final String orderId;
  final String name;
  final String totalAmount;

  Order({required this.orderId, required this.name, required this.totalAmount});
}

Future<void> addOrder(Order order) async {
  try {
    await FirebaseFirestore.instance.collection('orders').add({
      'orderId': order.orderId,
      'name': order.name,
      'totalAmount': order.totalAmount,
    });
    print('Order added successfully');
  } catch (e) {
    print('Error adding order: $e');
  }
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  double price = 3800;
  int qty = 1;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    print('data: ${widget.data}');
    Map<dynamic, dynamic> data = widget.data;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            widget.data['image'].toString(),
            width: media.width,
            height: media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: media.width - 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.data['name'],
                                        style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      )
                                    ]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "AFN${widget.data['price']}",
                                          style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 31,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.data['artistName'],
                                            style: TextStyle(
                                                color: TColor.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ])
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  ":جزئیات",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  widget.data['description'],
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Divider(
                                    color:
                                        TColor.secondaryText.withOpacity(0.4),
                                    height: 1,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 25,
                                              child: RoundIconButton(
                                                title: "افزودن به سبد خرید",
                                                icon:
                                                    "assets/img/shopping_add.png",
                                                color: TColor.primary,
                                                onPressed: () {
                                                  Order newOrder = Order(
                                                    orderId: widget.data[
                                                        'id'], // Replace with the actual order ID
                                                    name: widget.data[
                                                        'name'], // Replace with the actual customer name
                                                    totalAmount: widget.data[
                                                        'price'], // Replace with the actual total amount
                                                  );
                                                },
                                              ),
                                            )
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 25,
                                              child: RoundIconButton(
                                                title: "خرید",
                                                icon:
                                                    "assets/img/shopping_add.png",
                                                color: TColor.primary,
                                                onPressed: () {},
                                              ),
                                            )
                                          ])
                                    ]),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Container(
                    height: media.width - 20,
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(right: 4),
                    child: InkWell(
                        onTap: () {
                          isFav = !isFav;
                          setState(() {});
                        },
                        child: Image.asset(
                            isFav
                                ? "assets/img/favorites_btn.png"
                                : "assets/img/favorites_btn_2.png",
                            width: 70,
                            height: 70)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/img/btn_back.png",
                          width: 20,
                          height: 20,
                          color: TColor.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Order newOrder = Order(
                            orderId: widget
                                .data['id'], // Replace with the actual order ID
                            name: widget.data[
                                'name'], // Replace with the actual customer name
                            totalAmount: widget.data[
                                'price'], // Replace with the actual total amount
                          );

                          // Call the addOrder function to add the order to the Firestore collection
                          addOrder(newOrder);
                        },
                        icon: Image.asset(
                          "assets/img/shopping_cart.png",
                          width: 25,
                          height: 25,
                          color: TColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
