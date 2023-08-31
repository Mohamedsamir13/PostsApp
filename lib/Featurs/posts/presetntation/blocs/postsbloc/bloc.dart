import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:postsapp/Core/Erorrs/erorrs.dart';
import 'package:postsapp/Core/strings/falure.dart';
import 'package:postsapp/Featurs/posts/domain/entites/Postentity.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/getallposts.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/event.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPosts;

  PostsState _FailureOrPostState(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => ErrorPostsState(message: _MapFailureToMessage(failure)),
        (posts) => LoadedPostsState(posts: posts));
  }

  String _MapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCashFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Un expected erorr please try again later ";
    }
  }

  PostsBloc({
    required this.getAllPosts,
  }) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());

        final FailureOrPosts = await getAllPosts();
        emit(_FailureOrPostState(FailureOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final FailureOrPosts = await getAllPosts();
        emit(_FailureOrPostState(FailureOrPosts));
      }
    });
  }
}
