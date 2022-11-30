import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screen/login_screen.dart';
import 'package:e_mart/views/profile_screen/components/details_card.dart';
import 'package:e_mart/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
        body: SafeArea(
          child: Column(
            children: [
           //edit Profile button
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Align (alignment: Alignment.topRight,child: const Icon(Icons.edit, color:whiteColor,).onTap(() { })),
             ),
           

            //users details section

              Row(
                children: [
                  Image.asset(
                  imgProfile2, 
                  width: 100,
                  fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       "Dummy User".text.fontFamily(semibold).white.make(),
                       "customer@example.com".text.white.make(),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor
                      )
                    ),
                    onPressed: ()async{
                      await Get.put(AuthController().signoutMethod(context));
                      Get.offAll(()=> const LoginScreen());
                    },
                   child: logout.text.fontFamily(semibold).white.make()
                   )
                ],
              ),
              15.heightBox,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          detailsCard(count: "00",title: "in your card", width:context.screenWidth/3.4),
          detailsCard(count: "32",title: "in your wishlist", width:context.screenWidth/3.4),
          detailsCard(count: "00",title: "Your orders", width:context.screenWidth/3.4),
          
          ],
         ),

        //buttons secton

     
           ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
          return const Divider(color: lightGrey,);
          },
          itemCount: profileButtonList.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Image.asset(profileButtonsIcon[index],width: 22,),
              title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make()
            );
          }
          ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
         
            ],
          ) 
          ),
    ));
  }
}