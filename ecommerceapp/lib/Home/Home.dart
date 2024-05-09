import 'package:ecommerceapp/CartScreen/CartScreen.dart';
import 'package:ecommerceapp/HomeScreen/HomeScreen.dart';
import 'package:ecommerceapp/categoryScreen/CategoryScreen.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';

import '../AccountScreen/AccountScreen.dart';
import '../HomeController/Home_Controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var naviteam = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 24), label: cat),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 24), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 24), label: account),
    ];

    var navBody = [
      homeScreen(),
      categoryScreen(),
      cartScreen(),
      accountScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentIndex.value)))
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            backgroundColor: whiteColor,
            selectedItemColor: redColor,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            items: naviteam,
            onTap: (value) {
              controller.currentIndex.value = value;
            }),
      ),
    );
  }
}
