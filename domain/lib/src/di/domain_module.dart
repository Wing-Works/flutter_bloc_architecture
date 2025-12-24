import 'package:domain/src/di/domain_module.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'initDomainModule')
void $initDomainModule(GetIt getIt) => getIt.initDomainModule();
