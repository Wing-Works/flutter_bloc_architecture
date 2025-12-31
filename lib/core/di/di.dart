import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc_architecture/core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
void initDependencyInjection() {
  getIt.init();
  $initDataModule(getIt);
  $initDomainModule(getIt);
}
