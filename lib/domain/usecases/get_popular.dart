import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/domain_repositories/movie_repository.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/usecases.dart';

class GetPopular extends UseCases<List<MovieEntity>, NoParams> {
  MovieRepository movieRepository;
  GetPopular(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return movieRepository.getPopular();
  }
}
