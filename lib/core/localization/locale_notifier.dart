import 'package:cnc_toolbox/core/localization/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    return AppLanguage.polish.locale;
  }
  void setLocale(AppLanguage language) {
    if (state == language.locale) return;
    state = language.locale;
  }
}
