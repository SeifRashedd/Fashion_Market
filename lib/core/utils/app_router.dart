import 'package:fashion_market/Features/auth/presention/views/widgets/login_view.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/register_view.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/home_view.dart';
import 'package:fashion_market/Features/splash/presentation/views/widgets/splash_view.dart';
import 'package:fashion_market/constants.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter
{
  static final  router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
}