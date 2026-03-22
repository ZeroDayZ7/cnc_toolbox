// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier responsible for managing UI-related preferences and configuration.
///
/// It acts as a bridge between the [LocalSettingsRepository] and the UI,
/// ensuring that layout and visibility settings are persisted across sessions.

@ProviderFor(SettingsNotifier)
final settingsProvider = SettingsNotifierProvider._();

/// Notifier responsible for managing UI-related preferences and configuration.
///
/// It acts as a bridge between the [LocalSettingsRepository] and the UI,
/// ensuring that layout and visibility settings are persisted across sessions.
final class SettingsNotifierProvider
    extends $NotifierProvider<SettingsNotifier, SettingsState> {
  /// Notifier responsible for managing UI-related preferences and configuration.
  ///
  /// It acts as a bridge between the [LocalSettingsRepository] and the UI,
  /// ensuring that layout and visibility settings are persisted across sessions.
  SettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsNotifierHash();

  @$internal
  @override
  SettingsNotifier create() => SettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsState>(value),
    );
  }
}

String _$settingsNotifierHash() => r'8cb9f55efffc50332f49448c124dae047cf6ba42';

/// Notifier responsible for managing UI-related preferences and configuration.
///
/// It acts as a bridge between the [LocalSettingsRepository] and the UI,
/// ensuring that layout and visibility settings are persisted across sessions.

abstract class _$SettingsNotifier extends $Notifier<SettingsState> {
  SettingsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SettingsState, SettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingsState, SettingsState>,
              SettingsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
