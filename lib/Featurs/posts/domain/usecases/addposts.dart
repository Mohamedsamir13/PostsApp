import 'package:dartz/dartz.dart';
import 'package:postsapp/Core/Erorrs/erorrs.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/domain/reposatory/posts_repos.dart';

  class AddPostUsecase {
    final PostsRepository repository;

    AddPostUsecase(this.repository);

    Future<Either<Failure, Unit>> call(Post post) async {
      return await repository.addPost(post);
    }
  }