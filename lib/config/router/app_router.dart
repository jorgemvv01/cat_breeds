import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/presentation/cat_detail/screen/cat_detail_screen.dart';
import 'package:cat_breeds/presentation/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';


@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cat-detail',
      builder: (context, state) => CatDetailScreen(
        cat: state.extra as Cat
      ),
    )
  ]);
}