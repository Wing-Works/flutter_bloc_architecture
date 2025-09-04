import 'package:data/src/di/data_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initDataModule')
Future<void> $initDataModule(GetIt getIt) async {
  getIt.initDataModule();
}
