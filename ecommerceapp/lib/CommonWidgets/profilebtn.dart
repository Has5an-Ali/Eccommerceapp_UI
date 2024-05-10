import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/conts/consts.dart';

Widget details({width, String? counting, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      counting!.text.color(darkFontGrey).fontFamily(semibold).make(),
      title!.text.color(darkFontGrey).fontFamily(semibold).make(),
    ],
  ).box.white.rounded.height(65).width(width).padding(EdgeInsets.all(4)).make();
}
