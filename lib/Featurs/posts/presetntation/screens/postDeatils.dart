import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:postsapp/Core/apptext/apptext.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/PostDeatilWidget/postdeatilwidget.dart';

class PostDeatils extends StatelessWidget {
  const PostDeatils({Key? key,required this.posts}) : super(key: key);
final Post posts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(),
    body: buildbody(),
    );

  }

  AppBar appBar() {
    return AppBar(
      title: const Center(
        child: AppText(text:"Post Deatils",color: Colors.white,),
      )
    );
  }
  Widget buildbody(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PostDeatilWidget(post: posts,)
      ),
    );
  }
}
