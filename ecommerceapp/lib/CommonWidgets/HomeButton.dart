import 'package:ecommerceapp/conts/consts.dart';

 Widget homeButton({width , height, String? title , icon , onPress}) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Image.asset(icon , width: 26,),
       5.heightBox,
       title!.text.fontFamily(semibold).make(),
     ],
   ).box.rounded.white.size(width, height).make();
}