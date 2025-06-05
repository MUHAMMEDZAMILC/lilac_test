import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/theme/app_theme.dart';
import 'package:lilac_test/features/auth/controller/provider/loginnumber_provider.dart';
import 'package:lilac_test/features/auth/controller/provider/otpverify_provider.dart';
import 'package:provider/provider.dart';
import 'core/contants/app_constants.dart';
import 'core/routes/app_router.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(430, 932), 
      minTextAdapt: true,
        splitScreenMode: true,
         rebuildFactor: (old, data) => old.size != data.size || old.devicePixelRatio != data.devicePixelRatio,
         builder: (context, child) {
           final isTablet = MediaQuery.of(context).size.width > 600;
          
          // Apply different text scaling for tablets
          if (isTablet) {
            ScreenUtil.init(
              context, 
              designSize: const Size(744, 1133), // iPad Mini portrait size
              minTextAdapt: true,
              splitScreenMode: true,
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => LoginwithnumberProvider(),),
              ChangeNotifierProvider(create: (context) => OtpverifyProvider(),),
            ],
            builder: (context,child) {
              return MaterialApp(
                  title: AppConstants.appname,
                  debugShowCheckedModeBanner: false,
                   navigatorKey: navKey,
                  initialRoute: '/',
                  onGenerateRoute: RouteGenerator.generateRoute,
                      
                  // // Add the route observer to track navigation
                  // navigatorObservers: [routeObserver],
                      
                  theme: AppTheme.lightTheme,
              
                  themeMode: ThemeMode.light,
                );
            }
          );
         
         },
    );
  }
}