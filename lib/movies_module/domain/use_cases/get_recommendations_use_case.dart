import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_exceptions/api_exceptions.dart';
import '../entities/movie.dart';

class GetRecommendationsUseCase{
  final BaseRepository baseRepository;

  GetRecommendationsUseCase(this.baseRepository);

  Future<Either<ServerException, List<Movies>>> executeGetRecommentations(String movieID)async{
    return await baseRepository.getMovieRecommendations(movieID);
  }
}