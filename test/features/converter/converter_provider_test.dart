import 'package:cnc_toolbox/features/converter/application/converter_provider.dart';
import 'package:cnc_toolbox/features/converter/data/units_data.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  group('ConverterNotifier Tests', () {
    late ProviderContainer container;
    final lengthCategory = converterCategories.firstWhere(
      (c) => c.id == ConverterGroup.length,
    );

    setUp(() async {
      await initializeDateFormatting('pl', null);
      Intl.defaultLocale = 'pl';
      container = ProviderContainer();
    });

    tearDown(() => container.dispose());

    test('initial state should be empty', () {
      final state = container.read(converterProvider(lengthCategory));
      expect(state.values, isEmpty);
    });

    test(
      'updating value should calculate all other units with PL formatting',
      () {
        final notifier = container.read(
          converterProvider(lengthCategory).notifier,
        );
        notifier.updateValue('m', '1', lengthCategory.units);

        final state = container.read(converterProvider(lengthCategory));
        final formatter = NumberFormat('#,###', 'pl_PL');

        expect(state.values['m'], '1');
        expect(state.values['mm'], formatter.format(1000));
      },
    );

    test('empty input should clear all values', () {
      final notifier = container.read(
        converterProvider(lengthCategory).notifier,
      );

      notifier.updateValue('m', '10', lengthCategory.units);
      notifier.updateValue('m', '', lengthCategory.units);

      final state = container.read(converterProvider(lengthCategory));
      expect(state.values, isEmpty);
    });

    test('invalid numeric input should clear state values safely', () {
      final notifier = container.read(
        converterProvider(lengthCategory).notifier,
      );

      notifier.updateValue('m', '10', lengthCategory.units);
      notifier.updateValue('m', '1.2.3.invalid', lengthCategory.units);

      final state = container.read(converterProvider(lengthCategory));
      expect(state.values, isEmpty);
    });

    test(
      'decimal input with comma should be parsed correctly in PL locale',
      () {
        final notifier = container.read(
          converterProvider(lengthCategory).notifier,
        );

        notifier.updateValue('m', '1,5', lengthCategory.units);

        final state = container.read(converterProvider(lengthCategory));
        expect(state.values['mm'], '1 500');
      },
    );

    test(
      'extreme large values should be formatted with thousands separator',
      () {
        final notifier = container.read(
          converterProvider(lengthCategory).notifier,
        );

        notifier.updateValue('m', '1000', lengthCategory.units);

        final state = container.read(converterProvider(lengthCategory));
        expect(state.values['mm'], '1 000 000');
      },
    );

    test('switching between units should maintain calculation precision', () {
      final notifier = container.read(
        converterProvider(lengthCategory).notifier,
      );

      notifier.updateValue('mm', '25.4', lengthCategory.units);

      final state = container.read(converterProvider(lengthCategory));
      expect(state.values['m'], '0,0254');
    });
  });
}
