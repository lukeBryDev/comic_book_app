import 'package:comic_book_app/src/features/data/dataSources/comic_vine_remote_data_source.dart';
import 'package:comic_book_app/src/features/data/repositories/comics_repository_impl.dart';
import 'package:comic_book_app/src/features/domain/dataSources/comics_remote_data_source.dart';
import 'package:comic_book_app/src/features/domain/repositories/comics_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:comic_book_app/src/features/domain/useCases/use_cases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // USE CASES
  sl.registerLazySingleton(() => GetComicsUseCase(sl()));
  sl.registerLazySingleton(() => GetComicDetailUseCase(sl()));

  // REPOSITORIES
  sl.registerLazySingleton<ComicsRepository>(
      () => ComicsRepositoryImpl(remoteDataSource: sl()));

  // DATA SOURCES
  sl.registerLazySingleton<ComicsRemoteDataSource>(
      () => ComicVineRemoteDataSource());
}
