import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postsapp/Core/apptext/apptext.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_event.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const AppText(
          text: 'Are You Sure ?',
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No')),
          TextButton(
              onPressed: () {
                BlocProvider.of<AddDeleteUpdatePostBloc>(context)
                    .add(DeletePostEvent(postId: postId));
              },
              child: Text('Yes')),
        ]);
  }
}
