import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/home_screen/home.dart';
import 'package:e_mart/widget_common/applogo_widget.dart';
import 'package:e_mart/widget_common/bg_widget.dart';
import 'package:e_mart/widget_common/custom_textfield.dart';
import 'package:e_mart/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool ? isCheck = false;

  var controllerAuth = Get.put(AuthController());

//text controllers

var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var passwordRetypeController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "join the $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                ()=> Column(
                  children: [
                    customTextField(hint: nameHint, title: name, controller: nameController, ispass: false),
                    customTextField(hint: emailHint, title: email, controller: emailController,ispass: false),
                    customTextField(hint: passwordHint, title: password, controller: passwordController,ispass: true),
                    customTextField(hint: passwordHint, title: retypePassword,controller: passwordRetypeController,ispass: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton( 
                        onPressed: () {},
                        child: forgetPass.text.make(),
                      ),
                    ),
                    5.heightBox,
                   
                    Row(
                      children: [
                        Checkbox(
                            activeColor: redColor,
                            checkColor: whiteColor,
                            value: isCheck,
                            onChanged: ((value) {
                             setState(() {
                               isCheck = value;
                             });
                            }),
                            ),
                            10.heightBox,
                            Expanded(
                              child: RichText(text: const TextSpan(
                                children: [
                            
                                  TextSpan(
                                    text: "i agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey
                                    )
                                    
                                  ),
                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                    )
                                    
                                  ),
                                  TextSpan(
                                    text: "&",
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: fontGrey
                                    )
                                    
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                    )
                                    
                                  )
                                ]
                              )),
                            )
                      ],
                    ),
                    controllerAuth.isloading.value ? const CircularProgressIndicator()
                    : ourButton(
                      color: isCheck == true
                      ?redColor :lightGrey,
                      title: signup,
                      textColor: whiteColor,
                      //fatch firebase store data
                      onPress: () async {
                        if(isCheck != false){
                          controllerAuth.isloading(true);
                          try{
                          await controllerAuth.signupMethod(
                            context: context, 
                            email: emailController.text,
                            password: passwordController.text)
                            .then((value) {
                              return controllerAuth.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text
                              );
                            }
                            ).then((value) {
                              VxToast.show(context, msg: loggedin) ;
                              Get.offAll(()=>const Home());
                            });
              
                          } catch(e) {
                       auth.signOut();
                       VxToast.show(context, msg: e.toString());
                       controllerAuth.isloading(false);
                          }
                        }
                      },
                    ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alredyHaveAccount,
                      style: TextStyle(
                        fontFamily: bold,
                        color: fontGrey
                      )
                      ),
                      TextSpan(
                        text: login,
                      style: TextStyle(
                        fontFamily: bold,
                        color: redColor
                      )
                      )
                    ]
                  )).onTap(() { 
                    Get.back();
                  })
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
