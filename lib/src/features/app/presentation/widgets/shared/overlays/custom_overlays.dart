import 'dart:developer';

import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:flutter/material.dart';

class Show {
  static void eitherError(Failure l) {
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
    return snackbarError("¡Ups, algo va mal!", message ?? "");
  }

  static void snackbarError(
    String? title,
    String? subTitle, {
    Duration? duration,
    Duration? delay,
    void Function()? onTap,
    void Function(dynamic data)? onTapWithData,
    dynamic data,
    Widget? widgetSubtitle,
  }) {
    Future.delayed(delay ?? const Duration(seconds: 0), () {
      //TODO: implement snack bar
      final Widget titleText = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.crisis_alert,
            color: Colors.orange,
            size: 20,
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(title ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          ),
          const SizedBox(
            width: 110,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      );

      final Widget? messageText = (subTitle != null && subTitle != "")
          ? Row(
              children: [
                Flexible(
                    child: Text(
                  subTitle,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            )
          : widgetSubtitle;
    });
  }
}
