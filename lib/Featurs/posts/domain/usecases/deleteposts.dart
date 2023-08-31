import 'package:dartz/dartz.dart';
import 'package:postsapp/Core/Erorrs/erorrs.dart';
import 'package:postsapp/Featurs/posts/domain/reposatory/posts_repos.dart';

class DeletePostsUseCase{
final  PostsRepository repos;

  DeletePostsUseCase(this.repos);
Future<Either<Failure,Unit>>call(int PostId)async{
  return await repos.deletePost(PostId);
}
}