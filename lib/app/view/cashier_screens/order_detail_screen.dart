import 'package:flutter/material.dart';
import 'package:mokpos/app/model/order_item_model.dart';
import 'package:mokpos/base/constant.dart';
import 'package:mokpos/widgets/back_button_black.dart';

import 'payment_method_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details commande"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                List<OrderItemModel> orderItems = [
                  OrderItemModel(
                    count: 2,
                    id: "JD",
                    name: "mED",
                    price: 200,
                    imageUrl: "imageUrl",
                  ),
                ];
                var orderItem = orderItems[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BlackIconButton(
                              child: Center(
                                child: Text(
                                  "${orderItem.count}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text("${orderItem.name}"),
                          ],
                        ),
                        Text("CFA ${orderItem.price! * orderItem.count!}")
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 0.3),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400]!,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:"),
                  Text("CFA 2000"),
                ],
              ),
              const SizedBox(height: 10),
              MyTextButton(
                // margin: EdgeInsets.symmetric(horizontal: 16),
                backgroundColor: Colors.green,
                label: "PAYER",
                onTap: () {
                  Constant.navigatePush(context, const PaymentMethodScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
