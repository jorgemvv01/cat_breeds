// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textFocusHash() => r'f3018a12f0fb9561d138e36a79986eba2f9479b0';

/// See also [textFocus].
@ProviderFor(textFocus)
final textFocusProvider = Provider<FocusNode>.internal(
  textFocus,
  name: r'textFocusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$textFocusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TextFocusRef = ProviderRef<FocusNode>;
String _$textControllerHash() => r'7b592e173b11f3eef604429f55d5f46685a11e0d';

/// See also [textController].
@ProviderFor(textController)
final textControllerProvider = Provider<TextEditingController>.internal(
  textController,
  name: r'textControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$textControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TextControllerRef = ProviderRef<TextEditingController>;
String _$catHash() => r'd57f8a547b6cc9ed45ef6f6255cb283c4d5d21fd';

/// See also [cat].
@ProviderFor(cat)
final catProvider = FutureProvider<List<Cat>>.internal(
  cat,
  name: r'catProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$catHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CatRef = FutureProviderRef<List<Cat>>;
String _$searchTextHash() => r'57078081bb524a2072f76442776136e7143d6a39';

/// See also [SearchText].
@ProviderFor(SearchText)
final searchTextProvider = NotifierProvider<SearchText, String>.internal(
  SearchText.new,
  name: r'searchTextProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchText = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
