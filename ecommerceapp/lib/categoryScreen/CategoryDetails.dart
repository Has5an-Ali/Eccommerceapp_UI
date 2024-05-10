import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/categoryScreen/itemdetails.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../CommonWidgets/socialList.dart';

class categoryDetails extends StatelessWidget {
  final String? title;
  categoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return commonBackground(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => subcat.text
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .size(13)
                      .makeCentered()
                      .box
                      .white
                      .size(150, 50)
                      .margin(EdgeInsets.symmetric(horizontal: 4))
                      .roundedSM
                      .make(),
                ),
              ),
            ),
            10.heightBox,

            // Item Container

            Expanded(
              child: Container(
                color: lightGrey,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(featureproduct[index]),
                        featuretitle1[index]
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .make()
                      ],
                    )
                        .box
                        .white
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .rounded
                        .make()
                        .onTap(() {
                      Get.to(() => itemDetails(title: "Dummy Iteam"));
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
