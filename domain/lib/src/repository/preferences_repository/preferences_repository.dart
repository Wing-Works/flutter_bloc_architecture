import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/database_error.dart';

abstract class PreferencesRepository {
  Future<Either<DatabaseError, bool>> saveThemeMode(bool isDarkMode);

  Future<Either<DatabaseError, bool>> getThemeMode();

  Future<Either<DatabaseError, bool>> clearThemeMode();
}
