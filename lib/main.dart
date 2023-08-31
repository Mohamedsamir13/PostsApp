import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/event.dart';
import 'injection_container.dart' as di;
import 'package:postsapp/Featurs/posts/presetntation/screens/postpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.indigo),
            title: 'Posts App',
            home: PostPage()));
  }
}
