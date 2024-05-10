import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/CommonWidgets/profilebtn.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/material.dart';

class accountScreen extends StatelessWidget {
  const accountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonBackground(
        child: Scaffold(
            body: SafeArea(
                child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Edit Profile
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.manage_accounts_outlined,
              size: 28,
              color: whiteColor,
            ),
          ),

          //Profile Image + Name + Logout Button
          Row(
            children: [
              Image.asset(
                imgProfile2,
                width: 90,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Username".text.white.fontFamily(semibold).make(),
                  "User@gamil.com".text.white.fontFamily(semibold).make()
                ],
              )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {},
                  child: "Logout"
                      .text
                      .color(whiteColor)
                      .fontFamily(semibold)
                      .make())
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              details(
                  counting: "00",
                  title: "In Cart",
                  width: (context.screenWidth / 3.9)),
              details(
                  counting: "52",
                  title: "In Wishlist",
                  width: (context.screenWidth / 3.9)),
              details(
                  counting: "502",
                  title: "Your Order",
                  width: (context.screenWidth / 3.9))
            ],
          )
        ],
      ),
    ))));
  }
}
