import 'package:flutter/material.dart';
import 'package:mokpos/app/view/product_model.dart';
import 'package:mokpos/base/constant.dart';
import '../../../widgets/my_drawer.dart';
import 'components/shop_grid_card.dart';
import 'components/shop_list_card.dart';
import 'order_detail_screen.dart';

class CashierHomeScreen extends StatefulWidget {
  const CashierHomeScreen({super.key});

  @override
  State<CashierHomeScreen> createState() => _CashierHomeScreenState();
}

class _CashierHomeScreenState extends State<CashierHomeScreen> {
  bool isGrid = false;

  void changeGrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productsModel = [
      ProductModel(
          name: "Med",
          price: 9999999,
          category: "Priceless",
          image:
              "https://media.istockphoto.com/id/1571641986/photo/avatar-n-2.jpg?s=1024x1024&w=is&k=20&c=WNXlWWvSeaGFGnTUiXSRNM-rkEaFkRGTy2vYQ0joS94="),
      ProductModel(
          name: "Med",
          price: 9999999,
          category: "Priceless",
          image:
              "https://media.istockphoto.com/id/1571641986/photo/avatar-n-2.jpg?s=1024x1024&w=is&k=20&c=WNXlWWvSeaGFGnTUiXSRNM-rkEaFkRGTy2vYQ0joS94="),
      ProductModel(
          name: "Med",
          price: 9999999,
          category: "Priceless",
          image:
              "https://media.istockphoto.com/id/1571641986/photo/avatar-n-2.jpg?s=1024x1024&w=is&k=20&c=WNXlWWvSeaGFGnTUiXSRNM-rkEaFkRGTy2vYQ0joS94="),
      ProductModel(
          name: "Med",
          price: 9999999,
          category: "Priceless",
          image:
              "https://media.istockphoto.com/id/1571641986/photo/avatar-n-2.jpg?s=1024x1024&w=is&k=20&c=WNXlWWvSeaGFGnTUiXSRNM-rkEaFkRGTy2vYQ0joS94="),
    ];

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
                              List<ProductModel> items = [
                                ProductModel(
                                  name: "med",
                                  price: 2900,
                                  category: "Med",
                                  image: "",
                                ),
                              ];
                              final item = items[index];
                              return ShopGridCard(
                                onAdd: () {
                                  // shopViewModel.addItemToCart(item);
                                },
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
                              List<ProductModel> items = [
                                ProductModel(
                                  name: "med",
                                  price: 2900,
                                  category: "Med",
                                  image: "",
                                ),
                              ];

                              final item = items[index];

                              return ShopListCard(
                                onAdd: () {
                                  // shopViewModel.addItemToCart(item);
                                },
                                shopItem: item,
                                onTap: () {},
                              );
                            },
                          );
                        }
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
        onTap: () {
            Constant.navigatePush(
              context,
              const OrderDetailScreen(),
            );

        },
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
                "3 Items",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Spacer(),
              Row(
                children: [
                  Text(
                    "Total: CFA 200",
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
