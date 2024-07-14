import 'package:clean/config/themes/themes.dart';
import 'package:clean/features/data/data%20sources/posts_remote_data_source_impl.dart';
import 'package:clean/features/data/repository/post_repository_impl.dart';
import 'package:clean/features/domain/use%20cases/posts_usecases.dart';
import 'package:clean/features/presentation/bloc/post_bloc.dart';
import 'package:clean/features/presentation/pages/posts_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PostBloc(
        postsUsecases: PostsUsecases(
          postRepository: PostRepositoryImpl(
            postRemoteDataSource: PostsRemoteDataSourceImpl(
              dio: Dio(),
            ),
          ),
        ),
      ),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: const PostsScreen(),
    );
  }
}
