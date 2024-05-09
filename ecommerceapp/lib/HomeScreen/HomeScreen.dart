import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../CommonWidgets/HomeButton.dart';
import '../CommonWidgets/socialList.dart';
import 'FeatureButtons.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        color: lightGrey,
        height: context.screenHeight,
        width: context.screenWidth,
        child: SafeArea(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: lightGrey,
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    labelText: search,
                    labelStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        itemCount: sliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            sliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .rounded
                              .clip(Clip.antiAlias)
                              .make();
                        }),
                    5.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButton(
                                width: context.screenWidth / 2.5,
                                height: context.screenHeight * 0.14,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? today : flash))),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        itemCount: Secondsliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            Secondsliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .rounded
                              .clip(Clip.antiAlias)
                              .make();
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeButton(
                            width: context.screenWidth / 3.5,
                            height: context.screenHeight * 0.14,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topcat
                                : index == 1
                                    ? brand
                                    : topseller),
                      ),
                    ),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: feature.text.fontFamily(bold).make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featureButton(
                                  title: featuretitle1[index],
                                  icon: featureimage1[index]),
                              10.heightBox,
                              featureButton(
                                  title: featuretitle2[index],
                                  icon: featureimage2[index]),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    20.heightBox,

                    // Feature Product

                    Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featurep.text.white.fontFamily(bold).size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            Image.asset(
                                              featureproduct[index],
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            "Laptop 8GB/256GB"
                                                .text
                                                .fontFamily(semibold)
                                                .color(darkFontGrey)
                                                .make(),
                                            "\$110"
                                                .text
                                                .color(redColor)
                                                .size(18)
                                                .fontFamily(bold)
                                                .make()
                                          ])
                                          .box
                                          .white
                                          .margin(EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .roundedSM
                                          .padding(EdgeInsets.all(8))
                                          .make()),
                            ),
                          )
                        ],
                      ),
                    ),
                    20.heightBox,

                    //Third Swapper
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 140,
                        enlargeCenterPage: true,
                        itemCount: Secondsliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            Secondsliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .rounded
                              .clip(Clip.antiAlias)
                              .make();
                        }),

                    20.heightBox,

                    // All Product
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 8 , mainAxisExtent: 300 , crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  GrideImage[index],
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                Spacer(),
                                "iPhone 8GB/256GB"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                "\$310"
                                    .text
                                    .color(redColor)
                                    .size(18)
                                    .fontFamily(bold)
                                    .make()
                              ])
                              .box
                              .white
                              .margin(EdgeInsets.symmetric(
                              horizontal: 4))
                              .roundedSM
                              .padding(EdgeInsets.all(12))
                              .make();
                        })
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
