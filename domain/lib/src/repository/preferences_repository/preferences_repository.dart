import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';

abstract class PreferencesRepository {
  Future<Either<NetworkError, void>> saveThemeMode(bool isDarkMode);

  Future<Either<NetworkError, bool>> getThemeMode();

  Future<Either<NetworkError, void>> clearThemeMode();
}
