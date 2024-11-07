import 'package:expense_fusion/design/components/c_app_bar.dart';
import 'package:expense_fusion/design/screens/startup/signin_controller.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../core/routes/app_pages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/select_image.dart';
import '../../../utils/validators.dart';
import '../../components/c_core_button.dart';
import '../../components/c_text.dart';
import '../../components/c_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller){
           return Scaffold(
             backgroundColor: bg,
             resizeToAvoidBottomInset: false,
             body:Form(
                 key: controller.loginKey,
                 autovalidateMode: AutovalidateMode.disabled,
                 child: SizedBox.expand(
                   child: SingleChildScrollView(
                     physics: defaultScrollablePhysics,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.topPadding,),
                            Center(child: selectIcon(AppIcon.login,width: 30,color: white),),
                            Center(child: CText('Welcome Back!',style: TextThemeX.text20.copyWith(fontSize: 25,fontWeight: FontWeight.w500),)),
                            Center(child: CText('Smart tracking for financial success',style: TextThemeX.text16,)),
                            SizedBox(height: 50,),
                            CTextField(
                              controller: controller.email,
                              validator: (value)=>AppValidator.emailValidator(value,errorMessage: 'Please enter email'),
                              hintText: 'Email',
                              suffixIcon: Icon(CupertinoIcons.mail,color: grey1,),
                            ),
                            SizedBox(height: 15,),
                            Obx(()=> CTextField(
                              hintText: 'Password',
                              controller: controller.password,
                              validator: (value)=>AppValidator.emptyNullValidator(value),
                              textInputAction: TextInputAction.done,
                              obscureText: controller.obscurePassword.value,
                              suffixIcon: selectIcon(
                                  width: 24,
                                  color: white,
                                  controller.obscurePassword.value? AppIcon.eyeOpen : AppIcon.eyeClose,
                                  onPressed: (){
                                    controller.obscurePassword.value=!controller.obscurePassword.value;
                                  }
                              ),

                            ),),
                            SizedBox(height: 30,),
                            Container(
                              padding: EdgeInsets.only(top: 10,right: 16,left: 16,bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                   controller.login();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Primarycolor,
                                  fixedSize:Size(334, 50),
                                ),
                                child: CText('Login',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CText("Don't have an account ? ",style: TextThemeX.text16,),
                                SizedBox(width: 10,),
                                CCoreButton(child: CText('Sign up',style:TextThemeX.text16),
                                    onPressed: (){
                                      Get.toNamed(Routes.Signup);
                                    }
                                ).showShimmer(color: Primarycolor)
                              ],),
                            SizedBox(height:30,),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: SocialLoginButton(
                                  buttonType: SocialLoginButtonType.google,
                                  onPressed: (){},
                                  borderRadius: 16,
                                  imageWidth: 24,
                                  height: 50,
                                  textColor: white,
                                  backgroundColor:primaryblack,
                              ),
                            )
                          ],
                        ),
                      ),
                 ),)) ,
           );
        });
  }
}
