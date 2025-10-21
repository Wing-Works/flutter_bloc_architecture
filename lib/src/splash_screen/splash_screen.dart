import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find your\nProduct',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40).h,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.center,
                      end: FractionalOffset.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: const Image(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 22,
                    ),
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    );
                  },
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
