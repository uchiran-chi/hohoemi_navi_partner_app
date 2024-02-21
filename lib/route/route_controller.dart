import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../comment_page.dart';
import '../login_page.dart';
import '../reaction_page.dart';
import '../success_registration_page.dart';
// import '../pages/first_signup_page.dart';
// import '../pages/home.dart';
// import '../pages/login_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routeProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, _) => const LoginPage(),
      ),
      GoRoute(
        path: '/reaction_page',
        builder: (context, _) => const ReactionPage(),
      ),
      GoRoute(
        path: '/comment_page',
        builder: (context, _) => const CommentPage(),
      ),
      GoRoute(
        path: '/success_registration_page',
        builder: (context, _) => const SuccessRegistrationPage(),
      ),
    ],
  ),
);
