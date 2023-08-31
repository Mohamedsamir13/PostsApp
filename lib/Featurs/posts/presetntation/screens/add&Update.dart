import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postsapp/Core/Widgets/loading_widget.dart';
import 'package:postsapp/Core/util.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/presetntation/Widgets/Post_Add_Update/form.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_state.dart';
import 'package:postsapp/Featurs/posts/presetntation/screens/postpage.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10),
          child:
          BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePostState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => PostPage()),
                        (route) => false);
              } else if (state is ErorrAddDeleteUpdatePostState) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.Message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePostState) {
                return LoadingWidget();
              }

              return FormWidget(
                  isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            },
          )),
    );
  }
}