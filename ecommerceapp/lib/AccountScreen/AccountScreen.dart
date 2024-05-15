import 'package:ecommerceapp/AccountScreen/EditaccountSection.dart';
import 'package:ecommerceapp/Auth_Screen/LoginScreen.dart';
import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/CommonWidgets/profilebtn.dart';
import 'package:ecommerceapp/CommonWidgets/socialList.dart';
import 'package:ecommerceapp/HomeController/Account_Controller.dart';
import 'package:ecommerceapp/HomeController/Auth_Controller.dart';
import 'package:ecommerceapp/Services/Firebase_Service.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class accountScreen extends StatelessWidget {
  const accountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return commonBackground(
        child: Scaffold(
            body: StreamBuilder(
                stream: Firestoreservice.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs[0];

                    return SafeArea(
                        child: Column(
                      children: [
                        // Edit Profile
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                controller.nameController.text = data['Name'];
                                controller.passController.text =
                                    data['Password'];
                                Get.to(() => EditScreen(
                                      data: data,
                                    ));
                              },
                              icon: const Icon(
                                Icons.manage_accounts_outlined,
                                size: 28,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),

                        //Profile Image + Name + Logout Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              data['ImageURL'] == ''
                                  ? Image.asset(
                                      imgProfile2,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data['ImageURL'],
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['Name']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make(),
                                  "${data['Email']}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make()
                                ],
                              )),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: whiteColor,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  onPressed: () async {
                                    await Get.put(authController())
                                        .usersignoutMethod();
                                    Get.offAll(() => const loginScreen());
                                  },
                                  child: "Logout"
                                      .text
                                      .color(whiteColor)
                                      .fontFamily(semibold)
                                      .make())
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            details(
                                counting: data['In_cart'],
                                title: "In Cart",
                                width: (context.screenWidth / 3.9)),
                            details(
                                counting: data['Wishlist'],
                                title: "In Wishlist",
                                width: (context.screenWidth / 3.9)),
                            details(
                                counting: data['Order_Count'],
                                title: "Your Order",
                                width: (context.screenWidth / 3.9))
                          ],
                        ),

                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profilebtn.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileiconbtn[index],
                                width: 22,
                              ),
                              title: profilebtn[index].text.make(),
                            );
                          },
                        )
                            .box
                            .white
                            .rounded
                            .padding(const EdgeInsets.all(16))
                            .shadowSm
                            .margin(const EdgeInsets.all(12))
                            .make()
                            .box
                            .color(redColor)
                            .make()
                      ],
                    ));
                  }
                })));
  }
}
