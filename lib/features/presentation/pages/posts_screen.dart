import 'package:clean/core/api/endpoints.dart';
import 'package:clean/features/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Posts",
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.refresh_outlined,
            ),
            onPressed: () {
              context.read<PostBloc>().add(
                    GetPostEvent(
                      endpoint: ApisEndpoints.postsEndpoints,
                    ),
                  );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          18,
        ),
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostFailureState) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is PostSuccessState) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Chip(
                    elevation: 0,
                    label: Text(
                      state.post.title,
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text("Empty"),
            );
          },
        ),
      ),
    );
  }
}
