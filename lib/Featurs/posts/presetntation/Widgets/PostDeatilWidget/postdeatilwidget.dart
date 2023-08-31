import 'package:flutter/material.dart';
import 'package:postsapp/Core/apptext/apptext.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/PostDeatilWidget/delete_postbtn.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/PostDeatilWidget/update_postbtn.dart';


class PostDeatilWidget extends StatelessWidget {
  const PostDeatilWidget({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          AppText(
            text: post.title,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          const Divider(
            height: 50,
          ),
          AppText(
            text: post.body,
            size: 16,
          ),
          const Divider(
            height: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtnWidget(post: post),
              DeletePostBtnWidget(postId: post.id!)
            ],
          ),
        ],
      ),
    );
  }

}
