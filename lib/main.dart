import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'business/views.dart';

void main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MaterialApp(
        title: 'TinyMusic',
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: getLightTheme(),
        // darkTheme: getDarkTheme(),
        // themeMode: lightMode ? ThemeMode.light : ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: Home.routeName,
        routes: <String, Widget Function(BuildContext)>{
          Home.routeName: (context) => const Home(),
          Login.routeName: (context) => const Login(),
          // MusicPlay.routeName: (context) => const MusicPlay(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          // systemNavigationBarColor: Colors.transparent,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: const Color(0xff1f1f1f),
          fontSize: 48.sp,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: const Color(0xff1f1f1f),
          size: 68.sp,
        ),
        surfaceTintColor: Colors.white,
      ),
      dividerColor: Colors.white.withOpacity(0.6),
      highlightColor: Colors.transparent,
      splashColor: const Color(0x200084ff),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6d67e4)),
      /* colorScheme: const ColorScheme.light(
        primary: Color(0xff0084ff),
        onPrimary: Colors.white,
        secondary: Color(0xffFF5D5D),
        onSecondary: Colors.white,
        background: Colors.white,
        surface: Color(0xfff3f6fc),
        onSurface: Color(0xff1f1f1f),
      ), */
      scaffoldBackgroundColor: const Color(0xfff8f9fd),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
