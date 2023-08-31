import 'package:flutter/material.dart';
import 'package:postsapp/Core/apptext/apptext.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/presetntation/screens/postDeatils.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({Key? key, required this.posts}) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: AppText(text: posts[index].id.toString()),
            title: AppText(
              text: posts[index].title,
              fontWeight: FontWeight.bold,
              size: 18,
            ),
            subtitle: AppText(
              text: posts[index].body,
              size: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDeatils(posts: posts[index]),
                  ));
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(
              thickness: 1,
            ),
        itemCount: posts.length);
  }
}
