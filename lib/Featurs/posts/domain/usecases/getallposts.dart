import 'package:dartz/dartz.dart';
import 'package:postsapp/Core/Erorrs/erorrs.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/domain/reposatory/posts_repos.dart';


class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}