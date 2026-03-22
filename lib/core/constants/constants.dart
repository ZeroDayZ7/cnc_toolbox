/// --- ROUTES ---
class Routes {
  static const home = '/';
  static const cuttingSpeed = '/cutting-speed';
  static const spindleSpeed = '/spindle-speed';
  static const feedRate = '/feed-rate';
  static const converter = '/converter';
  static const tolerances = '/tolerances';
  static const settings = '/settings';
  static const tapDrill = '/tap-drill';
  static const gdSymbols = '/gd-symbols';
  static const gCodes = '/g-codes';
}

/// --- APP INFO ---
class AppInfo {
  static const appName = 'VeloCNC';
  static const appVersion = '1.0.0';
  static const contactEmail = 'support@velocnc.com';
  static const websiteUrl = 'https://velocnc.com';
}

/// --- ASSETS ---
class AppAssets {
  static const tolerancesJson = 'assets/data/tolerances.json';
  static const gCodesJson = 'assets/data/g_codes.json';
}

/// --- PREFERENCES KEYS ---
class PreferencesKeys {
  static const isDarkMode = 'is_dark_mode';
  static const sidebarExpanded = 'sidebar_expanded';
  static const unitsKeyPrefix = 'units_';
}

/// --- APP CONFIG ---
class AppConfig {
  static const minSplashDuration = Duration(milliseconds: 1500);
  static const dbName = 'cnc_toolbox_db';
}

/// --- TOLERANCE DEFAULTS ---
class ToleranceDefaults {
  static const String holeLetter = 'H';
  static const String shaftLetter = 'h';
  static const String grade = '7';
}

/// --- LAYOUT & RESPONSIVE ---
class AppBreakpoints {
  static const double desktop = 900.0;
  static const double tablet = 600.0;
  static const double sidebarWidth = 280.0;
}

/// --- SYMBOLS ASSETS PATHS ---
class GdAssets {
  static const String basePath = 'assets/images/gd_t_symbols';
  static const String svgPath = '$basePath/svg';

  static const String straightness = 'straightness'; // prostoliniowość
  static const String flatness = 'flatness'; // płaskość
  static const String circularity = 'circularity'; // okrągłość
  static const String cylindricity = 'cylindricity'; // walcowość
  static const String profileLine = 'profile_line'; // profil linii
  static const String profileSurface = 'profile_surface'; // profil powierzchni
  static const String perpendicularity = 'perpendicularity'; // prostopadłość
  static const String angularity = 'angularity'; // nachylenie
  static const String parallelism = 'parallelism'; // równoległość
  static const String position = 'position'; // pozycja
  static const String concentricity = 'concentricity'; // współśrodkowość
  static const String symmetry = 'symmetry'; // symetria
  static const String circularRunout = 'circular_runout'; // bicie promieniowe
  static const String totalRunout = 'total_runout'; // bicie całkowite

  static const String datumFeature = 'datum_feature'; // bicie całkowite
}
