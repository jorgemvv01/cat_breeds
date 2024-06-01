// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$catServiceHash() => r'693746b34cf304c28e11b2ec3c5b3a413764b8f4';

/// See also [catService].
@ProviderFor(catService)
final catServiceProvider = AutoDisposeProvider<CatService>.internal(
  catService,
  name: r'catServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$catServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CatServiceRef = AutoDisposeProviderRef<CatService>;
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
String _$catHash() => r'e1b094c814256ad22fad13b0f5518d76663f3d89';

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
String _$catImageHash() => r'872d767caa521d0c5593fbcb3b43e0172ba82551';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [catImage].
@ProviderFor(catImage)
const catImageProvider = CatImageFamily();

/// See also [catImage].
class CatImageFamily extends Family<AsyncValue<CatImage?>> {
  /// See also [catImage].
  const CatImageFamily();

  /// See also [catImage].
  CatImageProvider call(
    dynamic refrenceImageId,
  ) {
    return CatImageProvider(
      refrenceImageId,
    );
  }

  @override
  CatImageProvider getProviderOverride(
    covariant CatImageProvider provider,
  ) {
    return call(
      provider.refrenceImageId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'catImageProvider';
}

/// See also [catImage].
class CatImageProvider extends FutureProvider<CatImage?> {
  /// See also [catImage].
  CatImageProvider(
    dynamic refrenceImageId,
  ) : this._internal(
          (ref) => catImage(
            ref as CatImageRef,
            refrenceImageId,
          ),
          from: catImageProvider,
          name: r'catImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$catImageHash,
          dependencies: CatImageFamily._dependencies,
          allTransitiveDependencies: CatImageFamily._allTransitiveDependencies,
          refrenceImageId: refrenceImageId,
        );

  CatImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.refrenceImageId,
  }) : super.internal();

  final dynamic refrenceImageId;

  @override
  Override overrideWith(
    FutureOr<CatImage?> Function(CatImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CatImageProvider._internal(
        (ref) => create(ref as CatImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        refrenceImageId: refrenceImageId,
      ),
    );
  }

  @override
  FutureProviderElement<CatImage?> createElement() {
    return _CatImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CatImageProvider &&
        other.refrenceImageId == refrenceImageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, refrenceImageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CatImageRef on FutureProviderRef<CatImage?> {
  /// The parameter `refrenceImageId` of this provider.
  dynamic get refrenceImageId;
}

class _CatImageProviderElement extends FutureProviderElement<CatImage?>
    with CatImageRef {
  _CatImageProviderElement(super.provider);

  @override
  dynamic get refrenceImageId => (origin as CatImageProvider).refrenceImageId;
}

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
