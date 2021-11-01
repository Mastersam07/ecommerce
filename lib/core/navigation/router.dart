import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/cart/cart_screen.dart';
import '../../ui/product/details_screen.dart';
import '../../ui/app_home.dart';
import 'route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainLayoutView:
      final args = settings.arguments;
      debugPrint('args: $args');
      return _getPageRoute(
          routeName: settings.name!,
          args: args!,
          view: AppHome(index: int.tryParse(args.toString())!));
    case CartView:
      return _getPageRoute(
          routeName: settings.name!,
          args: settings.arguments!,
          view: const CartScreen());
    case ProductDetailsView:
      return _getPageRoute(
          routeName: settings.name!,
          args: settings.arguments!,
          view: const DetailsScreen());
    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute(
    {String? routeName, Widget? view, Object? args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view!);
}

void moveTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<dynamic>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void moveToReplace(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.pushReplacement<dynamic, dynamic>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}
