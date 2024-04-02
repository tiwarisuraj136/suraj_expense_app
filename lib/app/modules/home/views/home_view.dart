import 'package:suraj_expense_app/app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'widgets/info_balance.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 200),
      SalesData(DateTime(2011), 150),
      SalesData(DateTime(2012), 340),
      SalesData(DateTime(2013), 320),
      SalesData(DateTime(2014), 400)
    ];

    return Scaffold(
      body: Stack(
        children: [
          //background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  appYellowSoft,
                  appPrimary.withOpacity(0.2),
                ],
              ),
            ),
          ),
          //page view
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/icons/cup1.png'),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: appTextSoft,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: appPrimary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('October'),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.notifications,
                            color: appPrimary,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Account Balance',
                          style: TextStyle(
                            color: appTextSoft,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          '\$9400',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoBalance(
                            color: appGreen,
                            icon: 'assets/icons/in.png',
                            info: 'Income',
                            uang: '\$5000',
                          ),
                          InfoBalance(
                            color: appRed,
                            icon: 'assets/icons/out.png',
                            info: 'Expenses',
                            uang: '\$1200',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const Text(
                        'Spend Frequency',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 180,
                          width: chartData.length * 100,
                          child: SfCartesianChart(
                            primaryXAxis: const DateTimeAxis(),
                            series: <CartesianSeries>[
                              // Renders line chart
                              LineSeries<SalesData, DateTime>(
                                color: appRed,
                                width: 1,
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) => 300,
                              ),
                              LineSeries<SalesData, DateTime>(
                                color: appPrimary,
                                width: 4,
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: appYellowSoft,
                            ),
                            child: const Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const Text(
                            'Week',
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                          const Text(
                            'Month',
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                          const Text(
                            'Year',
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Transaction',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: appVioletSoft,
                              ),
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  color: appPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFCFCFC).withOpacity(0.3),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: appYellowSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                        'assets/icons/shopping.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Shopping',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '- \$120',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: appRed,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Buy some grocery',
                                              style: TextStyle(
                                                color: appTextSoft,
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '10:00 AM',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: appTextSoft,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
