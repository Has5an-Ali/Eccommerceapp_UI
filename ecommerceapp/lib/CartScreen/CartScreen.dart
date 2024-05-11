import 'package:ecommerceapp/conts/consts.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(
        child: Container(
          child: 'Your Cart is Empty!'
              .text
              .color(Colors.black)
              .fontFamily(semibold)
              .make(),
        ),
      ),
    );
  }
}
