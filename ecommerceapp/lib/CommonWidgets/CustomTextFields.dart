import 'package:ecommerceapp/conts/consts.dart';

Widget customTextField({String? title, String? hint, controller, Ispass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(redColor).make(),
      TextFormField(
        obscureText: Ispass,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            labelText: hint,
            labelStyle: TextStyle(color: textfieldGrey, fontFamily: semibold),
            filled: true,
            fillColor: lightGrey,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 2))),
      )
    ],
  );
}
