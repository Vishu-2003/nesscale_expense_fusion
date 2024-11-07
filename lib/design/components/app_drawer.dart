import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_theme.dart';
import '../../utils/select_image.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String name='';
  String email='';
  @override
  void initState() {
    loadUser();
    super.initState();
  }
  Future<void>loadUser()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name=preferences.getString('name')?? 'Guest';
      email=preferences.getString('email') ?? 'Guest@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      shape: RoundedRectangleBorder(),
      width: 250,
      child: SingleChildScrollView(
        child: Container(
          color: primaryblack,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 150,
                child: Center(
                    child: ListTile(
                    leading: selectIcon(AppIcon.userLogo),
                      title: CText(name,style: TextThemeX.text18.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
                      subtitle: CText(email,style: TextThemeX.text16.copyWith(fontSize: 14),),
                    )

                ),

              ), Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: (){
                     Get.toNamed(Routes.SPACESACCOUNT);
                    },
                    leading:selectIcon(AppIcon.spaces),
                    title:CText('Spaces & Accounts',style: TextThemeX.text18.copyWith(fontWeight: FontWeight.w400,color: white),) ),
                  ListTile(
                    onTap: (){
                     Get.toNamed(Routes.Transaction);
                    },
                    leading: selectIcon(AppIcon.transaction),
                      title:CText('Transactions',style: TextThemeX.text18.copyWith(fontWeight: FontWeight.w400,color: white),)),
                  ListTile(
                    onTap: (){
                      Get.find<AuthRepository>().checkAndLogout();
                    },
                    leading: selectIcon(AppIcon.logout),
                      title:CText('Logout',style: TextThemeX.text18.copyWith(fontWeight: FontWeight.w400,color: red),)),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
