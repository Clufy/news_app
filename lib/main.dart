import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/widgets/splash_screen.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc2.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_event2.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider<RemoteArticlesBloc>(
          create: (context) => sl()..add(const GetArticles())),
      BlocProvider<RemoteArticlesBloc2>(
          create: (context) => sl()..add(const GetArticles2()))
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const SplashScreen()
      ),
    )
    ;
  }
}

