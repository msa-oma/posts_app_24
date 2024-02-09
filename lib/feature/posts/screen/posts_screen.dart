import 'package:flutter/material.dart';
import 'package:posts_app/feature/posts/data/api_service.dart';
import 'package:posts_app/feature/posts/model/post_model.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.getposts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                PostModel post = snapshot.data[index];

                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.purple.shade400,
                      child: Text(
                        '${post.id}',
                        style: const TextStyle(color: Colors.white),
                      )),
                  title: Text(
                    post.title,
                    style: const TextStyle(color: Colors.purple),
                  ),
                  subtitle: Text(post.body),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: 30,
                  indent: 30,
                  color: Colors.black.withOpacity(0.2),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
