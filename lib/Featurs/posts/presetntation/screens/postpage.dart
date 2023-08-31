import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postsapp/Core/Widgets/loading_widget.dart';
import 'package:postsapp/Core/apptext/apptext.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/Posts_Widget/messagWidget.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/Posts_Widget/postListWidget.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/event.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/state.dart';
import 'package:postsapp/Featurs/posts/presetntation/screens/add&Update.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.indigo),
          title: const Center(
            child: AppText(
              text: "Posts",
              fontWeight: FontWeight.bold,
              color: Colors.white,
              size: 30,
            ),
          )),
      body: _bulidbody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  _bulidbody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () => onRefresh(context),
                child: PostListWidget(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplay(Message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const PostAddUpdatePage(
                   isUpdatePost: false

                  ,
                )));
      },
      child: Icon(Icons.add),
    );
  }
  Future<void> onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
