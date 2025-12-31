// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(quantity, size) =>
      "Added ${quantity} item(s) (Size: ${size}) to basket!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addToBasket": MessageLookupByLibrary.simpleMessage("Add to Basket"),
    "addedToBasket": m0,
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "discountDescription": MessageLookupByLibrary.simpleMessage(
      "on all product\'s",
    ),
    "discountOffer": MessageLookupByLibrary.simpleMessage("50% OFF"),
    "failedToLoadProduct": MessageLookupByLibrary.simpleMessage(
      "Failed to load product details",
    ),
    "findYourProduct": MessageLookupByLibrary.simpleMessage(
      "Find Your Product",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "homeScreen": MessageLookupByLibrary.simpleMessage("Home Screen"),
    "inStock": MessageLookupByLibrary.simpleMessage("in stock"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "noBrand": MessageLookupByLibrary.simpleMessage("No Brand"),
    "noDescriptionAvailable": MessageLookupByLibrary.simpleMessage(
      "No description available",
    ),
    "pleaseSelectASize": MessageLookupByLibrary.simpleMessage(
      "Please select a size",
    ),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Oops! Something went wrong",
    ),
    "switchToDarkMode": MessageLookupByLibrary.simpleMessage(
      "Switch to Dark Mode",
    ),
    "switchToLightMode": MessageLookupByLibrary.simpleMessage(
      "Switch to Light Mode",
    ),
    "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
  };
}
