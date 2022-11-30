import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/widget_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String ? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
      actions: [
        IconButton(onPressed: (){}, 
        icon: const Icon(Icons.share),
        ),
        IconButton(onPressed: (){},
         icon: const Icon(Icons.favorite_outline),
        )
      ]
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
     
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //slider img section
                      VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: 3,
                        aspectRatio: 16/9,
                        itemBuilder: (context, index){
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        } 
                        ),
                        10.heightBox,
                        //title and details section
                        title!.text.size(16).fontFamily(semibold).color(darkFontGrey).make(),
                    10.heightBox,
                    // ignore: non_constant_identifier_names
                    VxRating(onRatingUpdate: (Value){},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                    ),
                    10.heightBox,
                   "\$30,000".text.size(18).fontFamily(bold).color(redColor).make(),
                    
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Seller".text.white.fontFamily(semibold).make(),
                      5.heightBox,
                      "In House Brands".text.fontFamily(semibold).size(16).color(darkFontGrey).make(),
                    ],
                        ),
                        ),
                        const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded, color: darkFontGrey,),    
                        )
                      ],
                    ).box.padding(const EdgeInsets.symmetric(horizontal: 16)).height(60).color(textfieldGrey).make(),
                    
                    //color section
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color :".text.color(darkFontGrey).make()
                            ),
                          Row (
                         children:List.generate(3, (index) =>
                         VxBox().size(40, 40).roundedFull.margin(const EdgeInsets.symmetric(horizontal:4)).color(Vx.randomPrimaryColor).make(), 
                         ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                       
                       //quantity row
                         Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity :".text.color(darkFontGrey).make()
                            ),
                          Row (
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                          "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                          10.widthBox,
                           "(0 available)".text.color(darkFontGrey).make(),

                        ],
                            ),
                            
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                     //total amount row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total :".text.color(darkFontGrey).make()
                            ),
                        "0.00".text.color(redColor).fontFamily(bold).make(),
                            
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make()

                      ],
                    ).box.white.shadowSm.make(),

                    //description section
                    10.heightBox,
                    "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    "This is a dummy and dummy description..".text.color(darkFontGrey).make(),
                    10.heightBox,
                    //buttons secton
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailButtonList.length, 
                        (index) => ListTile(
                          title: itemDetailButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                          trailing: const Icon(Icons.arrow_forward),
                        ))
                    ),
                   20.heightBox,
                    //products mey like section
              productsyoumaylike.text.color(darkFontGrey).fontFamily(bold).make(),
              10.heightBox,
                SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) => 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         
                          
                          children: [
                            Image.asset(
                              featuredProductestImg[index],
                              width: 150,
                              fit: BoxFit.cover,
                    
                      ),
                      10.heightBox,
                      "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                      10.heightBox,
                      "\$600".text.color(redColor).size(16).make()
                          ],
                        ).box.margin(const EdgeInsets.symmetric(horizontal: 4)).white.roundedSM.padding(const EdgeInsets.all(8)).make(),
                        
                        ),
                      ),
                    )
                    
                    ],
                  ),
                ),

              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: redColor,
                onPress: (){},
                textColor: whiteColor,
                title:"Add to cart", 
              ),
            )
          ],
        ),
      )
    );
  }
}