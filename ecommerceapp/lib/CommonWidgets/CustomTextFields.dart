import 'package:ecommerceapp/conts/consts.dart';


Widget customTextField({String? title , String? hint , controller})  {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.fontFamily(semibold).color(redColor).make(),
      TextFormField(
        decoration:  InputDecoration(
          isDense: true,
          labelText: hint,
          labelStyle: TextStyle(
            color: textfieldGrey,
            fontFamily: semibold
          ),
          filled: true,
          fillColor: lightGrey,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: redColor , width: 2)
          )
        ),
      )
    ],
  );
}