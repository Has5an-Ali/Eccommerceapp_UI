import 'package:ecommerceapp/CommonWidgets/Buttons.dart';
import 'package:ecommerceapp/conts/consts.dart';

class itemDetails extends StatelessWidget {
  final String? title;
  const itemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 300,
                        aspectRatio: 6 / 19,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                imgFc5,
                                fit: BoxFit.cover,
                              )
                            ],
                          );
                        }),
                    10.heightBox,
                    title!.text.color(darkFontGrey).fontFamily(semibold).size(16).make(),
                    10.heightBox,
                    VxRating(onRatingUpdate: (value){},
                    normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$3000".text.color(redColor).fontFamily(bold).size(20).make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(child:
                        Column(
                          children: [
                            "Seller".text.make(),
                            "In House".text.make(),
                          ],
                        )),
                        CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(Icons.message),
                        )
                      ],
                    ).box.height(60).color(textfieldGrey).make()
                  ],
                ),
              ),
            ),

          ),
          SizedBox(
              height: 60,
              width: double.infinity,
              child: ourButtons(
                  title: "Add Cart",
                  color: redColor,
                  textColor: whiteColor,
                  onPress: () {}
              ),
          ),


        ],
      ),
    );
  }
}
