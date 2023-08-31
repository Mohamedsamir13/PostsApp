import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postsapp/Core/Erorrs/erorrs.dart';
import 'package:postsapp/Core/strings/falure.dart';
import 'package:postsapp/Core/strings/messages.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/addposts.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/deleteposts.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/updatePosts.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_event.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUsecase addPostUsecase;
  final UpdatePostsUseCase updatePostsUseCase;
  final DeletePostsUseCase deletepostusecase;

  String _MapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Un expected erorr please try again later ";
    }
  }

  AddDeleteUpdatePostState _eitherDoneMessageOrErorrState(
      Either<Failure, Unit> _FailureOrDone, message) {
    return _FailureOrDone.fold(
        (failure) => ErorrAddDeleteUpdatePostState(
            Message: _MapFailureToMessage(failure)),
        (_) => MessageAddDeleteUpdatePostState(message: message));
  }

  AddDeleteUpdatePostBloc(
      {required this.addPostUsecase,
      required this.updatePostsUseCase,
      required this.deletepostusecase})
      : super(AddDeleteUpdatePostInitState()) {
    on((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final FailureOrDone = await addPostUsecase(event.post);
        emit(
            _eitherDoneMessageOrErorrState(FailureOrDone, ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final FailureOrDone = await updatePostsUseCase(event.post);
        emit(_eitherDoneMessageOrErorrState(
            FailureOrDone, UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final FailureOrDone = await deletepostusecase(event.postId);
        emit(_eitherDoneMessageOrErorrState(
            FailureOrDone, DELETE_SUCCESS_MESSAGE));
      }
    });
  }
}
