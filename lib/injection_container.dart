import 'package:get_it/get_it.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:postsapp/Core/Network/network_info.dart';
import 'package:postsapp/Featurs/posts/data/datasources/localdataSource.dart';
import 'package:postsapp/Featurs/posts/data/datasources/remotedatasource.dart';
import 'package:postsapp/Featurs/posts/domain/reposatory/post_repos_impl.dart';
import 'package:postsapp/Featurs/posts/domain/reposatory/posts_repos.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/addposts.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/deleteposts.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/getallposts.dart';
import 'package:postsapp/Featurs/posts/domain/usecases/updatePosts.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:postsapp/Featurs/posts/presetntation/blocs/postsbloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Features_Posts
  ///Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPostUsecase: sl(), deletepostusecase: sl(), updatePostsUseCase: sl()));

  ///UseCases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostsUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostsUseCase(sl()));

  ///Repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  ///DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: Client()));
  sl.registerLazySingleton<LocalDataSource>(() =>PostLocalImpl(sharedPreferences: sl()));
  

  ///NetWorkInfo/Core
  sl.registerLazySingleton<NetworkInfo >(() => NetworkImpl(sl()));
  ///External
  final sharedprefrences=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedprefrences);
  sl.registerLazySingleton(() =>http. Client());
  sl.registerLazySingleton(() =>InternetConnectionChecker());
}
