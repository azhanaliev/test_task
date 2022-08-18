import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects/screens/home_page.dart';
import 'package:flutter_projects/resources/app_themes.dart';
import 'package:flutter_projects/provider/home_page_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
            create: (_) => HomePageProvider()),
      ],
      child: Consumer<HomePageProvider>(builder: (context, provider, _) {
        return MaterialApp(
          title: 'Weather Counter',
          theme: provider.light ? AppThemes.lightTheme : AppThemes.darkTheme,
          home: const MyHomePage(title: 'Weather counter'),
        );
      }),
    );
  }
}
