import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_exceptions/api_exceptions.dart';
import '../entities/movie.dart';

class GetPopularUseCase{
  final BaseRepository baseRepository;

  GetPopularUseCase(this.baseRepository);

  Future<Either<ServerException, List<Movies>>> executeGetPopular()async{
    return await baseRepository.getPopular();
  }
}