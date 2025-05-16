import 'package:auto_route/auto_route.dart';
import 'package:velolog/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
