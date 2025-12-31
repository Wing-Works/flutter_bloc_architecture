import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@Injectable()
class SplashBloc extends BlocBase<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState());

  @override
  void mapEventToState() {
    on<SplashEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> slideAnimation;
}
