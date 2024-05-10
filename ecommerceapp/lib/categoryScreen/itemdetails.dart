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
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
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
                    title!.text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$3000"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(20)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Seller"
                                .text
                                .color(whiteColor)
                                .fontFamily(bold)
                                .make(),
                            "In House Brand".text.size(14).make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(Icons.message),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .color(Vx.randomColor)
                                    .roundedFull
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make(),
                              ),
                            )
                          ],
                        ),

                        //Quantity Section :
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                "0".text.make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                "(0 available)".text.color(textfieldGrey).make()
                              ],
                            )
                          ],
                        ),

                        // Price Section

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Price :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                "\$0.00".text.color(redColor).make(),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                        .box
                        .white
                        .shadowSm
                        .padding(const EdgeInsets.all(8))
                        .make(),
                    20.heightBox,
                    "Description".text.fontFamily(bold).make(),
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"
                        .text
                        .make(),
                    20.heightBox,
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          5,
                          (index) => Column(
                                children: ["Video".text.make()],
                              )),
                    )
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
                onPress: () {}),
          ),
        ],
      ),
    );
  }
}
