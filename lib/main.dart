import 'package:boutique/presentation/router/app_router.dart';
import 'package:boutique/providers/cart.dart';
import 'package:boutique/providers/isar_services.dart';
import 'package:boutique/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/category/add_category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IsarServices>(create: (_) => IsarServices()),
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: _appRouter.routes,
      ),
    );
  }
}
