import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Customer Details"),
          ),
          body: const Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    InfoRow(
                      title: "Med",
                    ),
                    SizedBox(height: 20),
                    InfoRow(
                      title: "med@gmail.com",
                    ),
                    SizedBox(height: 20),
                    InfoRow(
                      fontSize: 12,
                      title: "28828",
                    ),
                    Divider(height: 15),
                    SizedBox(height: 40),
                    Text(
                      "Budget",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: Text("Wagyu Black Paper"),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlackIconButton(
                                child: Center(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text("CFA 1500"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: Text("Wagyu Black Paper"),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlackIconButton(
                                child: Center(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text("CFA 1500"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: Text("Wagyu Sate"),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlackIconButton(
                                child: Center(
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text("CFA 1500"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: Text("Diskon"),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.chevron_right),
                              Text("CFA 1500"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 15),
                    Row(
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
                                "CFA 6000",
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
                ),
              ),
            ),
          ),
        );

  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final double? fontSize;
  const InfoRow({
    super.key,
    required this.title,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Icon(Icons.chevron_right),
      ],
    );
  }
}
