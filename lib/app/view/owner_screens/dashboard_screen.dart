import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mokpos/app/model/dashboard_item_model.dart';
import 'package:mokpos/widgets/my_drawer.dart';

import '../../../base/constant.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: const Text("Dashboard"),
          ),
          drawer: const MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                       ListView.separated(
                        itemCount: dasboardItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          String mySubtitle = "";
                          if (index == 0) {
                            mySubtitle =
                                "CFA 200"
                                    .asAmount();
                          } else if (index == 1) {
                            mySubtitle =
                                "CFA 200"
                                    .asAmount();
                          } else if (index == 2) {
                            mySubtitle =
                                "CFA 400"
                                    .asAmount();
                          } else if (index == 3) {
                            mySubtitle =
                                "CFA 400"
                                    .asAmount();
                          } else if (index == 4) {
                            mySubtitle =
                                "CFA 3000"
                                    .asAmount();
                          } else {
                            mySubtitle = "ERROR";
                          }

                          return DashboardCard(
                            title: mySubtitle,
                            subtitle: dasboardItems[index].subtitle,
                            svgPath: dasboardItems[index].svgPath,
                          );
                        },
                      )

                ],
              ),
            ),
          ),
        );

  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgPath;
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SvgPicture.asset(svgPath),
        ],
      ),
    );
  }
}
