import 'package:flutter/material.dart';
import 'package:mokpos/app/view/budget_model.dart';
import 'package:uuid/uuid.dart';

import '../../base/constant.dart';
import '../../widgets/back_button_black.dart';
import 'add_budget_item_screen.dart';

class AddBudgetScreen extends StatelessWidget {
  const AddBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add budget"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              buildBudgetItems(context),
              const SizedBox(height: 50),
              MyTextButton(
                backgroundColor: Colors.green,
                onTap: () {
                  Constant.navigatePush(context, const AddBudgetItemScreen());
                },
                label: "Ajouter un produit",
                margin: const EdgeInsets.all(16),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyTextButton(
        backgroundColor: Colors.green,
        onTap: () {},
        label: "ENREGISTRER",
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Column buildBudgetItems(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            return Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return const Divider(height: 25);
                  },
                  itemBuilder: (context, index) {
                    List<BudgetItems> items = [
                      BudgetItems(
                        id: const Uuid().v4(),
                        quantity: 3,
                        name: "Med",
                        price: 3,
                      ),
                    ];
                    BudgetItems item = items[index];

                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: Text("${item.name}"),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlackIconButton(
                                child: Center(
                                  child: Text(
                                    "${item.quantity}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text("CFA ${item.price}"),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Divider(height: 25),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(Icons.chevron_right),
                          Text(
                            "CFA 4004",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
