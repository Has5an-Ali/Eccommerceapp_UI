import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../CommonWidgets/common_bg.dart';
import '../CommonWidgets/socialList.dart';
import 'CategoryDetails.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonBackground(
      child: Scaffold(
          appBar: AppBar(
            title: topcat.text.fontFamily(bold).white.make(),
          ),
          body: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      categoryimage[index],
                    ),
                    const Spacer(),
                    "${categorytitle[index]}"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make()
                  ],
                ).box.white.rounded.make().onTap(() {
                  Get.to(() => categoryDetails(title: categorytitle[index]));
                });
              },
            ),
          )),
    );
  }
}
