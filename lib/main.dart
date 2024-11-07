import 'package:expense_fusion/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_pages.dart';
import 'design/components/life_cycle_manager.dart';
import 'design/components/unfocus_wreppar.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: bg,
    systemNavigationBarColor: bg,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UnFocusWrapper(
        child: LifeCycleManager(
        child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayColor: Colors.transparent.withOpacity(0.5),
    overlayWidgetBuilder: (_) {
    return Center(child: SpinKitCircle(color: Primarycolor));
    }, child: GetMaterialApp(
          title: 'Expense Fusion',
          initialRoute:Routes.SPLASH,
          theme: ThemeData(primaryColor: bg,splashColor: Colors.transparent),
          color: bg,
          debugShowCheckedModeBanner: false,
          getPages:AppPages.routes,
          unknownRoute: AppPages.UnKnown404,
          initialBinding: BindingX.initialBindings(),
        ),
          
    
        )
    ));
  }
}

