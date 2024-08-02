import 'package:flutter/material.dart';
import 'package:mokpos/app/view/budget_detail_screen.dart';
import 'package:mokpos/base/constant.dart';
import 'package:mokpos/widgets/back_button_black.dart';

import 'add_budget_screen.dart';

class BudgetListScreen extends StatelessWidget {
  const BudgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Liste des fiches budgétaire"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [

                         ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Constant.navigatePush(
                                  context,
                                  BudgetDetailScreen(budgetIndex: index),
                                );
                              },
                              title: Text(
                                "Budget ${index + 1}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                            );
                          },

                         )

                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: MyTextButton(
            onTap: () {
              Constant.navigatePush(context, const AddBudgetScreen());
            },
            label: "Ajouter une fiche budgétaire",
            margin: const EdgeInsets.all(16),
          ),
        );

  }
}
