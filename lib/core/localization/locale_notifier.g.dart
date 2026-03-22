// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier that manages the application's current [Locale] state.
///
/// This provider is kept alive throughout the app's lifecycle to ensure
/// language preferences are preserved during navigation and background tasks.

@ProviderFor(LocaleNotifier)
final localeProvider = LocaleNotifierProvider._();

/// A notifier that manages the application's current [Locale] state.
///
/// This provider is kept alive throughout the app's lifecycle to ensure
/// language preferences are preserved during navigation and background tasks.
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale> {
  /// A notifier that manages the application's current [Locale] state.
  ///
  /// This provider is kept alive throughout the app's lifecycle to ensure
  /// language preferences are preserved during navigation and background tasks.
  LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeNotifierHash() => r'a07296c5264f33415d292947b0d73a3fca0d9f2a';

/// A notifier that manages the application's current [Locale] state.
///
/// This provider is kept alive throughout the app's lifecycle to ensure
/// language preferences are preserved during navigation and background tasks.

abstract class _$LocaleNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
