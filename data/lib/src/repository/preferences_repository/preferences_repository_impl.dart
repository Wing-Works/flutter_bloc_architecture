import 'package:dartz/dartz.dart';
import 'package:data/src/source/preferences_data_source/preferences_local_ds.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl({required this.preferencesLocalDataSource});

  final PreferencesLocalDataSource preferencesLocalDataSource;

  @override
  Future<Either<DatabaseError, bool>> saveThemeMode(bool isDarkMode) async {
    try {
      final result = await preferencesLocalDataSource.saveThemeMode(isDarkMode);
      return right(result);
    } catch (e) {
      return left(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> getThemeMode() async {
    try {
      final result = await preferencesLocalDataSource.getThemeMode();
      return right(result);
    } catch (e) {
      return left(DatabaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<DatabaseError, bool>> clearThemeMode() async {
    try {
      final result = await preferencesLocalDataSource.clearThemeMode();
      return right(result);
    } catch (e) {
      return left(DatabaseError(message: e.toString()));
    }
  }
}
