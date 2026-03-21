// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier responsible for managing and persisting the application's visual theme.
///
/// It synchronizes the current [ThemeMode] with local storage to ensure
/// the user's preference (Light/Dark mode) is preserved across app restarts.

@ProviderFor(ThemeNotifier)
final themeProvider = ThemeNotifierProvider._();

/// Notifier responsible for managing and persisting the application's visual theme.
///
/// It synchronizes the current [ThemeMode] with local storage to ensure
/// the user's preference (Light/Dark mode) is preserved across app restarts.
final class ThemeNotifierProvider
    extends $NotifierProvider<ThemeNotifier, ThemeMode> {
  /// Notifier responsible for managing and persisting the application's visual theme.
  ///
  /// It synchronizes the current [ThemeMode] with local storage to ensure
  /// the user's preference (Light/Dark mode) is preserved across app restarts.
  ThemeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeNotifierHash();

  @$internal
  @override
  ThemeNotifier create() => ThemeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeNotifierHash() => r'7c14a96c0ea465c9c52470eef67a430a5755d41f';

/// Notifier responsible for managing and persisting the application's visual theme.
///
/// It synchronizes the current [ThemeMode] with local storage to ensure
/// the user's preference (Light/Dark mode) is preserved across app restarts.

abstract class _$ThemeNotifier extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
