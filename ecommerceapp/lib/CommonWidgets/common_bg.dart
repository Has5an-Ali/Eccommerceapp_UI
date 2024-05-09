import 'package:ecommerceapp/conts/consts.dart';

Widget commonBackground( {required Scaffold child}) {

  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground) , fit: BoxFit.cover)
    ),
    child: child,
  );


}