import 'package:flutter/material.dart';
import 'package:mokpos/app/view/product_model.dart';
import 'package:mokpos/widgets/back_button_black.dart';

import '../../base/constant.dart';
import '../../widgets/my_drawer.dart';
import 'add_product_screen.dart';
import 'cashier_screens/components/shop_grid_card.dart';
import 'cashier_screens/components/shop_list_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isGrid = false;

  void changeGrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Point de vente"),
      ),
      drawer: const MyDrawer(),
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
                        onPressed: () {
                          changeGrid();
                        },
                        icon: const Icon(Icons.grid_view),
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
                    Builder(
                      builder: (context) {
                        if (isGrid) {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.85,
                            ),
                            itemBuilder: (context, index) {
                              List<ProductModel> models = [
                                ProductModel(
                                  name: "Med",
                                  category: "MONEY",
                                  price: 10,
                                  image: "",
                                ),
                              ];
                              final item = models[index];

                              return ShopGridCard(
                                showAdd: false,
                                onAdd: () {},
                                shopItem: item,
                                onTap: () {},
                              );
                            },
                          );
                        } else {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              List<ProductModel> models = [
                                ProductModel(
                                  name: "Med",
                                  category: "MONEY",
                                  price: 10,
                                  image: "",
                                ),
                              ];

                              final item = models[index];

                              return ShopListCard(
                                showAdd: false,
                                onAdd: () {
                                },
                                shopItem: models[index],
                                onTap: () {},
                              );
                            },
                          );
                        }
                      },
                    ),
                    //
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyTextButton(
        onTap: () {
          Constant.navigatePush(context, const AddProductScreen());
        },
        label: "Ajouter un produit",
        margin: const EdgeInsets.symmetric(horizontal: 16),
      ),
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     if (shopViewModel.cartItems.isNotEmpty) {
      //       Constant.navigatePush(context, OrderDetailScreen());
      //     }
      //   },
      //   child: Container(
      //     margin: EdgeInsets.symmetric(horizontal: 16),
      //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      //     decoration: BoxDecoration(
      //       color: Colors.green,
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text(
      //           "${shopViewModel.cartItems.length} Items",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //         // Spacer(),
      //         Row(
      //           children: [
      //             Text(
      //               "Total: CFA ${shopViewModel.totalPrice}",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //             Icon(
      //               Icons.chevron_right,
      //               color: Colors.white,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
