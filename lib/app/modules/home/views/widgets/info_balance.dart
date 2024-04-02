import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/color.dart';

class InfoBalance extends StatelessWidget {
  const InfoBalance({
    required this.icon,
    required this.info,
    required this.uang,
    super.key,
    required this.color,
  });

  final String icon;
  final String info;
  final String uang;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.43,
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appWhite,
            ),
            child: Image.asset(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    info,
                    style: const TextStyle(
                      color: appWhite,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    uang,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: appWhite,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
