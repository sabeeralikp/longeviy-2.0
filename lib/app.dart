import 'package:flutter/material.dart';
import 'package:longeviy/config/theme_data.dart';
import 'package:longeviy/providers/google_sign_in_provider.dart';
import 'package:longeviy/providers/routes/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Longevity 2.0',
          theme: longevityLightTheme(context),
          initialRoute: RouteProvider.authWrapperRoute,
          onGenerateRoute: RouteProvider.generateRoute,
        ),
      );
}
