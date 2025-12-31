import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/stateful/base_stateful_widget.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc_architecture/src/home/home_screen.dart';
import 'package:flutter_bloc_architecture/src/splash/bloc/splash_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends BaseStatefulWidget<SplashBloc> {
  const SplashScreen(super.bloc, {super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BasePageState<SplashBloc, SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    bloc.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    bloc.fadeAnimation =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: bloc.animationController,
            curve: const Interval(0, 0.6, curve: Curves.easeOut),
          ),
        );

    bloc.slideAnimation =
        Tween<double>(
          begin: 30,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: bloc.animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    bloc.animationController.forward();
  }

  @override
  Color? get backgroundColor => Theme.of(context).primaryColor;

  @override
  Widget buildView(BuildContext context, SplashBloc bloc) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);

    return SafeArea(
      minimum: const EdgeInsets.all(24).r,
      child: AnimatedBuilder(
        animation: bloc.animationController,
        builder: (_, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              FadeTransition(
                opacity: bloc.fadeAnimation,
                child: Transform.translate(
                  offset: Offset(0, bloc.slideAnimation.value),
                  child: Text(
                    loc.findYourProduct,
                    style: GoogleFonts.poppins(
                      color: theme.textTheme.displaySmall?.color,
                      height: 1.2,
                      fontSize: 44.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              // Image Section with flexible space
              Expanded(
                child: FadeTransition(
                  opacity: bloc.fadeAnimation,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.h,
                      horizontal: 20.w,
                    ),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0.7, 1.0],
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(
                        'assets/images/splash.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 80,
                              color: Colors.white24,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Button Section
              FadeTransition(
                opacity: bloc.fadeAnimation,
                child: Transform.translate(
                  offset: Offset(0, -bloc.slideAnimation.value),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.cardColor,
                      foregroundColor: theme.primaryColor,
                      minimumSize: Size(double.infinity, 56.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      textStyle: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: _navigateToHome,
                    child: Text(loc.getStarted),
                  ),
                ),
              ),

              // Bottom spacing for visual balance
              SizedBox(height: 8.h),
            ],
          );
        },
      ),
    );
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(
      context,
      HomeScreen.routeName,
    );
  }

  @override
  void dispose() {
    bloc.animationController.dispose();
    super.dispose();
  }
}
