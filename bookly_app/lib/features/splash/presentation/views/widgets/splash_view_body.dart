import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    initSlideAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 6,
        ),
        SlidingText(animation: animation),
      ],
    );
  }

  void initSlideAnimation() {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(controller);
    controller.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(
      //   () =>const HomeView(),
      //   transition: Transition.fade,
      //   duration: kTransitionDuration,
      // );
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
