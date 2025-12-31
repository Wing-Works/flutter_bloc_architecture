// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/intl/messages_all.dart';
import 'package:intl/intl.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message('Home Screen', name: 'homeScreen', desc: '', args: []);
  }

  /// `Find Your Product`
  String get findYourProduct {
    return Intl.message(
      'Find Your Product',
      name: 'findYourProduct',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Switch to Light Mode`
  String get switchToLightMode {
    return Intl.message(
      'Switch to Light Mode',
      name: 'switchToLightMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch to Dark Mode`
  String get switchToDarkMode {
    return Intl.message(
      'Switch to Dark Mode',
      name: 'switchToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `50% OFF`
  String get discountOffer {
    return Intl.message('50% OFF', name: 'discountOffer', desc: '', args: []);
  }

  /// `on all product's`
  String get discountDescription {
    return Intl.message(
      'on all product\'s',
      name: 'discountDescription',
      desc: '',
      args: [],
    );
  }

  /// `No Brand`
  String get noBrand {
    return Intl.message('No Brand', name: 'noBrand', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `No description available`
  String get noDescriptionAvailable {
    return Intl.message(
      'No description available',
      name: 'noDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Add to Basket`
  String get addToBasket {
    return Intl.message(
      'Add to Basket',
      name: 'addToBasket',
      desc: '',
      args: [],
    );
  }

  /// `Please select a size`
  String get pleaseSelectASize {
    return Intl.message(
      'Please select a size',
      name: 'pleaseSelectASize',
      desc: '',
      args: [],
    );
  }

  /// `Added {quantity} item(s) (Size: {size}) to basket!`
  String addedToBasket(Object quantity, Object size) {
    return Intl.message(
      'Added $quantity item(s) (Size: $size) to basket!',
      name: 'addedToBasket',
      desc: '',
      args: [quantity, size],
    );
  }

  /// `Oops! Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Oops! Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load product details`
  String get failedToLoadProduct {
    return Intl.message(
      'Failed to load product details',
      name: 'failedToLoadProduct',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `in stock`
  String get inStock {
    return Intl.message('in stock', name: 'inStock', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
