import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_core_button.dart';
import 'package:expense_fusion/design/components/c_text.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/design/screens/startup/signup_controller.dart';
import 'package:expense_fusion/utils/app_assets.dart';
import 'package:expense_fusion/utils/app_text_theme.dart';
import 'package:expense_fusion/utils/constants.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:expense_fusion/utils/select_image.dart';
import 'package:expense_fusion/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller){
          return Scaffold(
            backgroundColor: bg,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: controller.signUpKey,
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
                          Center(child: CText('Create Account',style: TextThemeX.text20.copyWith(fontSize: 25,fontWeight: FontWeight.w500),)),
                          Center(child: CText('You may change your information later',style: TextThemeX.text16,)),
                          SizedBox(height: 50,),
                          CTextField(
                            controller: controller.userName,
                            validator: (value)=>AppValidator.emptyNullValidator(value,errorMessage: 'Please enter name'),
                            hintText: 'Name',
                            suffixIcon: Icon(CupertinoIcons.person,color: grey1),
                          ),
                          SizedBox(height: 15,),
                          CTextField(
                            controller: controller.email,
                            validator: (value)=>AppValidator.emailValidator(value,errorMessage: 'Please enter email'),
                            hintText: 'Email',
                            suffixIcon: Icon(CupertinoIcons.mail,color: grey1,),
                          ),
                          SizedBox(height: 15,),
                          CTextField(
                            controller: controller.number,
                            validator: (value)=>AppValidator.phoneValidator(value),
                            hintText: 'Phone number',
                            suffixIcon: Icon(CupertinoIcons.phone,color: grey1,),

                          ),
                          SizedBox(height: 15,),
                          Obx(()=> CTextField(
                            hintText: 'Password',
                            controller: controller.password,
                            validator: (value)=>AppValidator.passwordValidator(value,errorMessage: 'Please create password'),
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
                          SizedBox(height: 15,),
                          Obx(()=> CTextField(
                            controller: controller.coPassword,
                            textInputAction: TextInputAction.done,
                            hintText: 'Confirm password',
                            validator: (value){
                              if(value!.isEmpty)return'Enter confirm  password';
                              else if(value!=controller.password.text){
                                return  "Password doesn't match";
                              }
                              return null;
                            },
                            obscureText: controller.obscureConfirmPassword.value,
                            suffixIcon: selectIcon(
                                width: 24,
                                color: white,
                                controller.obscureConfirmPassword.value? AppIcon.eyeOpen : AppIcon.eyeClose,
                                onPressed: (){
                                  controller.obscureConfirmPassword.value=!controller.obscureConfirmPassword.value;
                                }
                            ),
                          ),),
                          SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.only(top: 10,right: 16,left: 16,bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                print(controller.password.text);
                                controller.signUp();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Primarycolor,
                                fixedSize:Size(334, 50),
                              ),
                              child: CText('Submit',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CText('Allready have account ?',style: TextThemeX.text16,),
                              SizedBox(width: 10,),
                              CCoreButton(child: CText('Login',style:TextThemeX.text16),
                                  onPressed: (){
                                    Get.toNamed(Routes.Login);
                                  }
                              ).showShimmer(color: Primarycolor)
                            ],)

                        ],
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}

