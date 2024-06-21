import 'package:fashion_market/Features/auth/presention/views/login_view.dart';
import 'package:fashion_market/Features/auth/presention/views/register_view.dart';
import 'package:fashion_market/Features/home/presentation/views/favorite_view.dart';
import 'package:fashion_market/Features/home/presentation/views/home_view.dart';
import 'package:fashion_market/Features/home/presentation/views/menu_view.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/menu_item_view.dart';
import 'package:fashion_market/Features/splash/presentation/views/splash_view.dart';
import 'package:fashion_market/constants.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
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
      GoRoute(
        path: kMenuView,
        builder: (context, state) => const MenuView(),
      ),
      GoRoute(
        path: kFavoriteView,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: kCategoryview,
        builder: (context, state) => const MenuItemView(),
      )
    ],
  );
}
