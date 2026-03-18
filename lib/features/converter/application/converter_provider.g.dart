// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConverterNotifier)
final converterProvider = ConverterNotifierFamily._();

final class ConverterNotifierProvider
    extends $NotifierProvider<ConverterNotifier, ConverterState> {
  ConverterNotifierProvider._({
    required ConverterNotifierFamily super.from,
    required ConverterGroup super.argument,
  }) : super(
         retry: null,
         name: r'converterProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$converterNotifierHash();

  @override
  String toString() {
    return r'converterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ConverterNotifier create() => ConverterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConverterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConverterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConverterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$converterNotifierHash() => r'a3efa944412cc21048bc3d7a9851c05c0f35135c';

final class ConverterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ConverterNotifier,
          ConverterState,
          ConverterState,
          ConverterState,
          ConverterGroup
        > {
  ConverterNotifierFamily._()
    : super(
        retry: null,
        name: r'converterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ConverterNotifierProvider call(ConverterGroup category) =>
      ConverterNotifierProvider._(argument: category, from: this);

  @override
  String toString() => r'converterProvider';
}

abstract class _$ConverterNotifier extends $Notifier<ConverterState> {
  late final _$args = ref.$arg as ConverterGroup;
  ConverterGroup get category => _$args;

  ConverterState build(ConverterGroup category);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ConverterState, ConverterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConverterState, ConverterState>,
              ConverterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
