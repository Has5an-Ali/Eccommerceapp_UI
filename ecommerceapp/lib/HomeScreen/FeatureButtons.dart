import 'package:ecommerceapp/conts/consts.dart';

Widget featureButton({ icon , String ? title }) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 50,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.color(darkFontGrey).fontFamily(semibold).make()
    ],
  )
      .box
      .width(190)
      .rounded
      .white
      .padding(EdgeInsets.all(8))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .make();
}
