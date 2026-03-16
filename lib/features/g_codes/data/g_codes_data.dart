import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';

const cncCodes = [
  // --- G-KODY (Ruch i Geometria) ---
  GCode(
    code: "G00",
    titleKey: LocaleKeys.gcodes_g00_title,
    descriptionKey: LocaleKeys.gcodes_g00_desc,
    example: "G00 X50 Z10",
  ),
  GCode(
    code: "G01",
    titleKey: LocaleKeys.gcodes_g01_title,
    descriptionKey: LocaleKeys.gcodes_g01_desc,
    example: "G01 X50 Z-10 F0.2",
  ),
  GCode(
    code: "G02",
    titleKey: LocaleKeys.gcodes_g02_title,
    descriptionKey: LocaleKeys.gcodes_g02_desc,
    example: "G02 X50 Y20 I10 J0",
  ),
  GCode(
    code: "G03",
    titleKey: LocaleKeys.gcodes_g03_title,
    descriptionKey: LocaleKeys.gcodes_g03_desc,
    example: "G03 X50 Y20 I10 J0",
  ),
  GCode(
    code: "G04",
    titleKey: LocaleKeys.gcodes_g04_title,
    descriptionKey: LocaleKeys.gcodes_g04_desc,
    example: "G04 P2000 (2s)",
  ),
  GCode(
    code: "G17",
    titleKey: LocaleKeys.gcodes_g17_title,
    descriptionKey: LocaleKeys.gcodes_g17_desc,
    example: "G17",
  ),
  GCode(
    code: "G18",
    titleKey: LocaleKeys.gcodes_g18_title,
    descriptionKey: LocaleKeys.gcodes_g18_desc,
    example: "G18",
  ),
  GCode(
    code: "G19",
    titleKey: LocaleKeys.gcodes_g19_title,
    descriptionKey: LocaleKeys.gcodes_g19_desc,
    example: "G19",
  ),
  GCode(
    code: "G20",
    titleKey: LocaleKeys.gcodes_g20_title,
    descriptionKey: LocaleKeys.gcodes_g20_desc,
    example: "G20",
  ),
  GCode(
    code: "G21",
    titleKey: LocaleKeys.gcodes_g21_title,
    descriptionKey: LocaleKeys.gcodes_g21_desc,
    example: "G21",
  ),
  GCode(
    code: "G28",
    titleKey: LocaleKeys.gcodes_g28_title,
    descriptionKey: LocaleKeys.gcodes_g28_desc,
    example: "G28 U0 W0",
  ),
  GCode(
    code: "G40",
    titleKey: LocaleKeys.gcodes_g40_title,
    descriptionKey: LocaleKeys.gcodes_g40_desc,
    example: "G40",
  ),
  GCode(
    code: "G41",
    titleKey: LocaleKeys.gcodes_g41_title,
    descriptionKey: LocaleKeys.gcodes_g41_desc,
    example: "G41 D1 X20",
  ),
  GCode(
    code: "G42",
    titleKey: LocaleKeys.gcodes_g42_title,
    descriptionKey: LocaleKeys.gcodes_g42_desc,
    example: "G42 D1 X20",
  ),
  GCode(
    code: "G43",
    titleKey: LocaleKeys.gcodes_g43_title,
    descriptionKey: LocaleKeys.gcodes_g43_desc,
    example: "G43 H1 Z10",
  ),
  GCode(
    code: "G54",
    titleKey: LocaleKeys.gcodes_g54_title,
    descriptionKey: LocaleKeys.gcodes_g54_desc,
    example: "G54 X0 Y0",
  ),
  GCode(
    code: "G90",
    titleKey: LocaleKeys.gcodes_g90_title,
    descriptionKey: LocaleKeys.gcodes_g90_desc,
    example: "G90",
  ),
  GCode(
    code: "G91",
    titleKey: LocaleKeys.gcodes_g91_title,
    descriptionKey: LocaleKeys.gcodes_g91_desc,
    example: "G91",
  ),

  // --- M-KODY (Funkcje maszynowe) ---
  GCode(
    code: "M00",
    titleKey: LocaleKeys.mcodes_m00_title,
    descriptionKey: LocaleKeys.mcodes_m00_desc,
    example: "M00",
  ),
  GCode(
    code: "M03",
    titleKey: LocaleKeys.mcodes_m03_title,
    descriptionKey: LocaleKeys.mcodes_m03_desc,
    example: "M03 S1500",
  ),
  GCode(
    code: "M04",
    titleKey: LocaleKeys.mcodes_m04_title,
    descriptionKey: LocaleKeys.mcodes_m04_desc,
    example: "M04 S1500",
  ),
  GCode(
    code: "M05",
    titleKey: LocaleKeys.mcodes_m05_title,
    descriptionKey: LocaleKeys.mcodes_m05_desc,
    example: "M05",
  ),
  GCode(
    code: "M06",
    titleKey: LocaleKeys.mcodes_m06_title,
    descriptionKey: LocaleKeys.mcodes_m06_desc,
    example: "T1 M06",
  ),
  GCode(
    code: "M08",
    titleKey: LocaleKeys.mcodes_m08_title,
    descriptionKey: LocaleKeys.mcodes_m08_desc,
    example: "M08",
  ),
  GCode(
    code: "M09",
    titleKey: LocaleKeys.mcodes_m09_title,
    descriptionKey: LocaleKeys.mcodes_m09_desc,
    example: "M09",
  ),
  GCode(
    code: "M30",
    titleKey: LocaleKeys.mcodes_m30_title,
    descriptionKey: LocaleKeys.mcodes_m30_desc,
    example: "M30",
  ),
];
