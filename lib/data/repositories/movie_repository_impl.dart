import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_resources.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/domain_repositories/movie_repository.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movie = await movieRemoteDataSource.getTrending();
      return Right(movie);
    } on Exception {
      return Left(
        AppError('Something went wrong!'),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movie = await movieRemoteDataSource.getComingSoon();
      return Right(movie);
    } on Exception {
      return Left(
        AppError('Something went wrong!'),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movie = await movieRemoteDataSource.getPlayingNow();
      return Right(movie);
    } on Exception {
      return Left(
        AppError('Something went wrong!'),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movie = await movieRemoteDataSource.getPopular();
      return Right(movie);
    } on Exception {
      return Left(
        AppError('Something went wrong!'),
      );
    }
  }
}
