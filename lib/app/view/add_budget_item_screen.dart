import 'package:flutter/material.dart';
import 'package:mokpos/app/view/cashier_screens/components/shop_list_card.dart';
import 'package:mokpos/app/view/product_model.dart';

import 'cashier_screens/components/shop_grid_card.dart';

class AddBudgetItemScreen extends StatefulWidget {
  const AddBudgetItemScreen({super.key});

  @override
  State<AddBudgetItemScreen> createState() => _AddBudgetItemScreenState();
}

class _AddBudgetItemScreenState extends State<AddBudgetItemScreen> {
  bool isGrid = false;

  void changeGrid() {
    setState(() {
      isGrid = !isGrid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add product to budget"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 0.5),
            Container(
              height: 45,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tous les produits",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: changeGrid,
                        icon: Icon(isGrid ? Icons.list : Icons.grid_view),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.5),
            Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if (isGrid)
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.85,
                        ),
                        itemBuilder: (context, index) {
                          List<ProductModel> items = [
                            ProductModel(
                                name: "Med",
                                price: 233,
                                category: "Med",
                                image: "",),
                          ];
                          final item = items[index];

                          return ShopGridCard(
                            onAdd: () {},
                            shopItem: item,
                            onTap: () {},
                          );
                        },
                      )
                    else
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          List<ProductModel> items = [
                            ProductModel(
                              name: "Med",
                              price: 233,
                              category: "Med",
                              image: "",),
                          ];

                          final item = items[index];

                          return ShopListCard(
                            onAdd: () {
                            },
                            shopItem: items[index],
                            onTap: () {},
                          );
                        },
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(

        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "4Items",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Total: CFA 400",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
