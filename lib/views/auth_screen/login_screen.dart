import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/widget_common/applogo_widget.dart';
import 'package:e_mart/widget_common/bg_widget.dart';
import 'package:e_mart/widget_common/custom_textfield.dart';
import 'package:e_mart/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';
import 'signup_screen.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controllerAuth = Get.put(AuthController());

    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                ()=> Column(
                  children: [
                   customTextField(hint: emailHint,title: email, ispass: false, controller: controllerAuth.emailController),
                   customTextField(hint: passwordHint,title: password, ispass: true, controller: controllerAuth.passwordController),
                   Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){}, 
                      child: forgetPass.text.make(),
                      
                    ),
                   ),
                   5.heightBox,
              controllerAuth.isloading.value
               ? const CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(redColor),)
               :ourButton(
                  color: redColor,
                  title: login,
                  textColor: whiteColor,
                  onPress: () async{
                   controllerAuth.isloading(true);
                    await controllerAuth.loginMethod(context: context).then((value) {
                      if (value != null){
                        VxToast.show(context, msg: loggedin);
                    
                         //Get.to(()=> const Home());
                         Get.offAll(()=>const Home());
                      } else{
                        controllerAuth.isloading(false);
                      }
                    });
                   
                  },
                 ).box.width(context.screenWidth -50).make(),
              
                 5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                  color: lightGolden,
                  title: signup,
                  textColor: redColor,
                  onPress: (){
                 Get.to(()=> const SignupScreen());
                  },
                 ).box.width(context.screenWidth -50).make(),
              
                 10.heightBox,
                 loginWith.text.color(fontGrey).make(),
                 5.heightBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                     backgroundColor: lightGrey,
                     radius: 25,
                      child: Image.asset(
                        socialIconList[index],
                        width: 30,
                        ),
                    ),
                  ))
                 )
              
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
