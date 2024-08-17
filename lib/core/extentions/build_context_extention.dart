import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ThemeExtensions on BuildContext {
  //context.locale вместо AppLocalizations.of(context)
  AppLocalizations? get locale => AppLocalizations.of(this);
}