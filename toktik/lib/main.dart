import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/config/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = VideoPostRepositoryImpl(
      dataSource: LocalVideoDataSourceImpl()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, 
          create: (_) => DiscoverProvider(
            repository: repository
          )..loadNextPage()
        )
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
