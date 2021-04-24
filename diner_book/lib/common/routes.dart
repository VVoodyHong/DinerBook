import 'package:diner_book/screens/diner_book_screen/write_diner_book_screen/write_diner_book.dart';
import 'package:flutter/material.dart';

import 'package:diner_book/screens/diner_book_screen/diner_book_detail_screen/my_diner_book_detail.dart';
// import 'package:diner_book/screens/my_diner_book_screen/my_diner_book.dart';
// import 'package:diner_book/screens/chatting_screen/chatting.dart';
// import 'package:diner_book/screens/time_line_screen/time_line.dart';
// import 'package:diner_book/screens/view_more_screen/view_more.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String);

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument a RegEx match if that is included
  /// in the pattern.
  ///
  /// ```dart
  /// Path(
  ///   'r'^/demo/([\w-]+)$',
  ///   (context, matches) => Page(argument: match),
  /// )
  /// ```
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  
  static List<Path> paths = [
    
    // Path(
    //   '/DinerBook',
    //   (context, match) => DinerBookScreen()
    // ),
    // Path(
    //   '/timeLine',
    //   (context, match) => TimeLineScreen()
    // ),
    // Path(
    //   '/chatting',
    //   (context, match) => ChattingScreen()
    // ),
    // Path(
    //   '/viewMore',
    //   (context, match) => ViewMoreScreen()
    // )
    Path(
      '/DinerBook/detail',
      (context, match) => DinerBookDetailScreen()
    ),
    Path(
      '/DinerBook/write',
      (context, match) => WriteDinerBookScreen()
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;

        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}