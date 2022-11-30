import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/views/category_screen/category_details.dart';
import 'package:e_mart/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CetogryScreen extends StatelessWidget {
  const CetogryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200
              
              ), 
            itemBuilder: (context, index) {
              return  Column(
              children: [
                Image.asset(categoryImages[index],
                height: 120,
                width: 200,
                fit: BoxFit.cover,
                ),
                10.heightBox,
                categoriesList[index].text.align(TextAlign.center).color(darkFontGrey).make(),
              ],
              ).box.white.rounded.clip(Clip.antiAlias).outerShadow.make().onTap(() {
                Get.to(()=> CategoryDetails(title: categoriesList[index]));
              });
            }
            ),
        ),

      )
    );
  }
}