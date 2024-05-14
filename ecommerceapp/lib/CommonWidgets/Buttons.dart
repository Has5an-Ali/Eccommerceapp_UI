import 'package:ecommerceapp/conts/consts.dart';

Widget ourButtons({
  color,
  textColor,
  required String title,
  onPress,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    onPressed: onPress,
    child: title.text.color(textColor).fontFamily(bold).make(),
  );
}
