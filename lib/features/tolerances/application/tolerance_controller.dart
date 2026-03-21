import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/features/tolerances/application/tolerance_service.dart';
import 'package:cnc_toolbox/features/tolerances/domain/tolerance_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'tolerance_provider.dart';

part 'tolerance_controller.g.dart';

@Riverpod(keepAlive: true)
class ToleranceController extends _$ToleranceController {
  @override
  TolerancePageState build() {
    final service = ref.watch(toleranceServiceProvider).value;
    if (service == null) return const TolerancePageState();

    return _initialState(service);
  }

  TolerancePageState _initialState(ToleranceService service) {
    final letters = service.getLetters(ToleranceType.hole);
    final initialLetter = letters.contains(ToleranceDefaults.holeLetter)
        ? ToleranceDefaults.holeLetter
        : (letters.isNotEmpty ? letters.first : null);

    List<String> numbers = [];
    String? initialNumber;

    if (initialLetter != null) {
      numbers = service.getNumbersForLetter(ToleranceType.hole, initialLetter);
      initialNumber = numbers.contains(ToleranceDefaults.grade)
          ? ToleranceDefaults.grade
          : (numbers.isNotEmpty ? numbers.first : null);
    }

    return TolerancePageState(
      type: ToleranceType.hole,
      availableLetters: letters,
      selectedLetter: initialLetter,
      availableNumbers: numbers,
      selectedNumber: initialNumber,
    );
  }

  void updateType(ToleranceType newType) {
    final service = ref.read(toleranceServiceProvider).requireValue;
    final letters = service.getLetters(newType);

    String? letter;
    if (newType == ToleranceType.hole) {
      letter = letters.contains(ToleranceDefaults.holeLetter)
          ? ToleranceDefaults.holeLetter
          : (letters.isNotEmpty ? letters.first : null);
    } else {
      letter = letters.contains(ToleranceDefaults.shaftLetter)
          ? ToleranceDefaults.shaftLetter
          : (letters.isNotEmpty ? letters.first : null);
    }

    state = state.copyWith(
      type: newType,
      selectedLetter: letter,
      availableLetters: letters,
      result: null,
    );
    _updateNumbers();
  }

  void updateDiameter(String value) {
    state = state.copyWith(diameterInput: value);
    _calculate();
  }

  void updateLetter(String? letter) {
    state = state.copyWith(selectedLetter: letter, result: null);
    _updateNumbers();
  }

  void updateNumber(String? number) {
    state = state.copyWith(selectedNumber: number);
    _calculate();
  }

  void _updateNumbers() {
    if (state.selectedLetter == null) return;
    final service = ref.read(toleranceServiceProvider).requireValue;
    final numbers = service.getNumbersForLetter(
      state.type,
      state.selectedLetter!,
    );

    state = state.copyWith(
      availableNumbers: numbers,
      selectedNumber: numbers.contains(ToleranceDefaults.grade)
          ? ToleranceDefaults.grade
          : (numbers.isNotEmpty ? numbers.first : null),
    );
    _calculate();
  }

  void _calculate() {
    final diameter = double.tryParse(state.diameterInput);
    if (diameter == null ||
        state.selectedLetter == null ||
        state.selectedNumber == null) {
      state = state.copyWith(result: null);
      return;
    }

    final service = ref.read(toleranceServiceProvider).requireValue;
    final result = service.calculate(
      diameter,
      state.selectedLetter!,
      state.selectedNumber!,
      state.type,
    );
    state = state.copyWith(result: result);
  }
}
