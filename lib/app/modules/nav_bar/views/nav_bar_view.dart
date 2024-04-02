import 'package:suraj_expense_app/app/constant/color.dart';
import 'package:suraj_expense_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:suraj_expense_app/app/modules/nav_bar/controllers/nav_bar_controller.dart';


class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: SvgPicture.asset('assets/icons/transaction.svg'),
            title: "Transaction",
          ),
        ),
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: const Icon(
              Icons.add,
              color: appWhite,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: SvgPicture.asset('assets/icons/pie-chart.svg'),
            title: "Budget",
          ),
        ),
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: const Icon(
              Icons.person,
              color: Color(0XFFC6C6C6),
            ),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
