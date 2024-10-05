import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/screens/menu/menu.dart';
import 'package:health/screens/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            indicatorColor: Colors.green,
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Anasyfa'),
              NavigationDestination(
                  icon: Badge(child: Icon(Icons.menu_book)), label: 'Menü'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(
      color: Colors.purple,
    ),
    const MenuScreen(),
    const ProfilePage(),
  ];
}
