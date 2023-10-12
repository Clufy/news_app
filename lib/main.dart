import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/injection_container.dart';

 Future<void> main() async {
  initializeDependencies();
  runApp(const MyApp()) ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: DailyNews(),
   );
  }
}

