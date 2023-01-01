import 'package:clean_arch/movies_module/domain/repository/base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/api_exceptions/api_exceptions.dart';
import '../entities/movie.dart';

class GetNowPlayingUseCase{
  final BaseRepository baseRepository ;

  GetNowPlayingUseCase(this.baseRepository);

  Future<Either<ServerException, List<Movies>>> executeNowPlaying()async{
    return await baseRepository.getNowPlaying();
  }
}