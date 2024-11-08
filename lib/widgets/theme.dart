import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightThemeColors {
  const LightThemeColors._();

  // Primary Colors
  static const Color primary = Color(0xff121212);

  // Secondary Colors
  static const Color secondary = Color(0xFF3B82F6);

//   // Surface Colors
  static const Color primaryContainer = Color(0xFFFFFFFF);

//
  // Background Color
  static const Color scaffoldBackground = Color(0xffB9B9B9);
  static const Color bottomSheetBackground = Colors.white;
  static const Color dialogBackground = Colors.white;
  static const Color background = Colors.white;
  static const Color buttonBackground = primary;
  static const Color textFieldBackground = primary;
  static const Color appBarBackground = background;
  static const Color bottomNavigationBarBackground = primary;
  static Color barrierBackground = background.withOpacity(0.53);
  static const secondaryText = Color(0xFF616161);

  // Surface Colors
  static const Color surface = Color(0xFF1E251F);
  static Color surfaceSecondary = const Color(0xFF3C3C3C).withOpacity(0.61);
  static Color surfaceSuccess = const Color(0xFF32E444).withOpacity(0.35);
  static Color surfaceError = LightThemeColors.error.withOpacity(0.35);

  // Text Colors
  // static const Color primaryText = Colors.white;
  // Text Colors
  static const Color textPrimary = Color(0xFF121212);
  static const Color textSecondary = Color(0xff3B82F6);
  static const Color textHint = Color(0xFF818181);
  // Text Colors
  static const _primaryValue = 0xFF000000;
  static MaterialColor primaryText = MaterialColor(
    _primaryValue,
    <int, Color>{
      10: const Color(_primaryValue).withOpacity(0.1),
      20: const Color(_primaryValue).withOpacity(0.2),
      30: const Color(_primaryValue).withOpacity(0.3),
      40: const Color(_primaryValue).withOpacity(0.4),
      50: const Color(_primaryValue).withOpacity(0.5),
      60: const Color(_primaryValue).withOpacity(0.6),
      70: const Color(_primaryValue).withOpacity(0.7),
      80: const Color(_primaryValue).withOpacity(0.8),
      90: const Color(_primaryValue).withOpacity(0.9),
      100: const Color(_primaryValue),
    },
  );

  // Validation Colors:
  static const Color error = Color(0xFFFF697D);
  static const Color success = Color(0xFF32E444);
  static const Color warning = Color(0xFFE39600);

  // Icons Colors
  static Color unselectedIcon = primaryText[70]!;
  static Color selectedIcon = primary;

  // button Colors
  static const Color buttonColor = primary;

  // Icons Colors

  // border Colors
  static Color border = const Color(0xff000000);
  static Color inputFieldBorder = primaryText[20]!;
  static const Color borderVariant = Color(0x26A7A7A7);

  // gradient
  static const List<Color> gradientPrimary = [
    Color(0xFF10B981),
    Color(0xFF3B82F6)
  ];
  // shadow
  static const Color shadow = Color(0x07FFFFFF);
  static const Color shadowVariant = Color(0x0AFFFFFF);
  static Color shadowBottomSheet = Colors.black.withOpacity(0.5);

  // gradient
  static List<Color> gradient = [
    Colors.white,
    // Colors.white.withOpacity(0.5),
    Colors.white.withOpacity(0),
  ];
  static const onPrimaryValue = 0xFFFFFFFF;
  static MaterialColor onPrimary = MaterialColor(
    onPrimaryValue,
    <int, Color>{
      10: const Color(onPrimaryValue).withOpacity(0.1),
      20: const Color(onPrimaryValue).withOpacity(0.2),
      30: const Color(onPrimaryValue).withOpacity(0.3),
      40: const Color(onPrimaryValue).withOpacity(0.4),
      50: const Color(onPrimaryValue).withOpacity(0.5),
      60: const Color(onPrimaryValue).withOpacity(0.6),
      70: const Color(onPrimaryValue).withOpacity(0.7),
      80: const Color(onPrimaryValue).withOpacity(0.8),
      90: const Color(onPrimaryValue).withOpacity(0.9),
      100: const Color(onPrimaryValue),
    },
  );
}

class LightTheme {
  static ThemeData getTheme() {
    // AppThemeManager.setStatusBarAndNavigationBarColors(ThemeMode.light);
    return ThemeData(
      //* Light Theme
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
      useMaterial3: true,

      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: "cairo",
      //  Utils.lang == "en" ? "arista" : "GESS",
      cardColor: LightThemeColors.primary,
      //* Card Theme *//

      //* Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF10B981),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFFFFF),
        onPrimaryContainer: Color(0xFF410002),
        secondary: LightThemeColors.secondary,
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFCFE5FF),
        onSecondaryContainer: Color(0xFF001D34),
        tertiary: Color(0xFF24223E),
        onTertiary: Color(0xFF24223E),
        tertiaryContainer: Color(0xFFFFDAD6),
        onTertiaryContainer: Color(0xFF410002),
        error: LightThemeColors.error,
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        surface: Color(0xFFFFFFFF),
        // surface: Color(0x05FFFFFF),
        onSurface: Color(0xFF001F25),
        surfaceContainerHighest: Color(0xFFF5DDDA),
        onSurfaceVariant: Color(0xFF534341),
        outline: Color(0xFF857371),
        onInverseSurface: Color(0xFFD6F6FF),
        inverseSurface: Color(0xFF00363F),
        inversePrimary: Color(0xFFFFB4AB),
        shadow: Color(0xFF000000),
        // app bar color on scroll
        surfaceTint: Color(0xFFFFFFFF),
        outlineVariant: Color(0xffff00000),
        scrim: Color(0xFF000000),
      ),

      //* App Bar Theme
      // appBarTheme: AppBarTheme(
      //   elevation: 0,
      //   centerTitle: false,
      //   scrolledUnderElevation: 0,
      //   backgroundColor: LightThemeColors.background,
      //   systemOverlayStyle: SystemUiOverlayStyle.dark,
      //   titleTextStyle:
      //       TextStylesManager.gessMedium.copyWith(fontSize: FontSize.s14, color: LightThemeColors.textPrimary),
      //   iconTheme: IconThemeData(color: LightThemeColors.primaryText),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(LightThemeColors.primary),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: LightThemeColors.primary,
          // color: DarkThemeColors.background,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          foregroundColor: LightThemeColors.scaffoldBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white)),

      // //* Text Theme

      // Display

      // //*  bottomNavigationBarTheme        //*  bottomNavigationBarTheme
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   elevation: 0,
      //   type: BottomNavigationBarType.fixed,
      //   selectedLabelStyle: TextStylesManager.cairo.regular.s10
      //       .setColor(LightThemeColors.selectedIcon),
      //   unselectedLabelStyle: TextStylesManager.cairo.regular.s10
      //       .setColor(LightThemeColors.unselectedIcon),
      //   backgroundColor: LightThemeColors.background,
      //   selectedItemColor: LightThemeColors.selectedIcon,
      //   unselectedItemColor: LightThemeColors.unselectedIcon,
      // ),

      //* Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: LightThemeColors.bottomSheetBackground,
        elevation: 0,
      ),

      //* Tab Bar Theme
      // tabBarTheme: TabBarTheme(
      //   indicatorSize: TabBarIndicatorSize.tab,
      //   indicator: BoxDecoration(
      //     color: LightThemeColors.primary,
      //     borderRadius: BorderRadius.circular(AppSize.mainRadius),
      //   ),
      //   indicatorColor: Colors.transparent,
      dividerColor: Colors.black.withOpacity(.05),
      //   labelColor: LightThemeColors.onPrimary,
      //   unselectedLabelColor: LightThemeColors.primaryText,
      //   labelStyle: TextStylesManager.cairo.s16,
      //   unselectedLabelStyle: TextStylesManager.cairo.s16,
      // ),

      //* TextButtonThemeData
      textButtonTheme: const TextButtonThemeData(),

      //* dividerTheme
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: LightThemeColors.inputFieldBorder,
      ),

      expansionTileTheme: ExpansionTileThemeData(
        iconColor: LightThemeColors.primaryText,
        textColor: LightThemeColors.primaryText,
      ),

      //* Input Decoration Theme
      // inputDecorationTheme: InputDecorationTheme(
      //   contentPadding: const EdgeInsets.symmetric(
      //       horizontal: AppSize.s16, vertical: AppSize.s16),
      //   hintStyle: TextStylesManager.cairo.regular.s16.ellipsis
      //       .setColor(LightThemeColors.hintText),
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
      //     borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
      //     borderSide: BorderSide.none,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
      //     borderSide: BorderSide.none,
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
      //     borderSide: BorderSide.none,
      //   ),
      //   focusedErrorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
      //     borderSide: BorderSide.none,
      //   ),
      //   filled: true,
      //   fillColor: LightThemeColors.primaryContainer,
      // ),
    );
  }
}
