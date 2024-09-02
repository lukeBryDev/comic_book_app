import 'dart:developer';

import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:flutter/material.dart';

class Show {
  static void eitherError(Failure l, BuildContext context) {
    var message = l.message;
    if (l is ServerFailure && l.data!.containsKey("data")) {
      try {
        message = message! +
            l.data!['data'].values
                .toString()
                .replaceAll("[", ",")
                .replaceAll("]", "")
                .replaceAll("(", "")
                .replaceAll(")", "");
      } catch (_) {
        log("$_", name: "Error: eitherError");
      }
    }
    return snackBarError(context, "¡Ups, algo va mal!", message ?? "");
  }

  static void snackBarError(
    BuildContext context,
    String? title,
    String? subTitle, {
    Duration? delay,
    void Function()? onTap,
    void Function(dynamic data)? onTapWithData,
    dynamic data,
    Widget? widgetSubtitle,
  }) {
    final snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //TODO: implement snack bar
  }
}
