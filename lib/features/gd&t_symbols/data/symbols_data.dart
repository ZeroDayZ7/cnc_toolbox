import 'package:cnc_toolbox/features/gd&t_symbols/domain/gd_symbol_model.dart';

const gdSymbolsList = [
  // Form Tolerances
  GdSymbol(
    name: "gd_symbols.items.straightness.name",
    symbol: "⏤",
    description:
        "Tolerancja prostoliniowości - ograniczona równoległymi liniami oddalonymi od siebie o wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/straightness.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.flatness.name",
    symbol: "⏥",
    description:
        "Tolerancja płaskości - ograniczona dwiema płaszczyznami oddalonymi od siebie o wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/flatness.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.circularity.name",
    symbol: "○",
    description:
        "Tolerancja okrągłości - ograniczona dwoma okręgami, różnica promieni = wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/circularity.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.cylindricity.name",
    symbol: "⌭",
    description:
        "Tolerancja walcowości - ograniczona dwoma współosiowymi walcami, różnica promieni podstaw = wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/cylindricity.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.profile_line.name",
    symbol: "⌒",
    description:
        "Tolerancja profilu linii - ograniczona okręgami, różnica promieni = wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/profile_line.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.profile_surface.name",
    symbol: "⌓",
    description:
        "Tolerancja profilu powierzchni - ograniczona sferami większą i mniejszą, różnica promieni = wartość tolerancji.",
    category: SymbolCategory.form,
    requiresDatum: false,
    assetImage: "assets/images/gd_t_symbols/profile_surface.png",
  ),

  // Orientation Tolerances
  GdSymbol(
    name: "gd_symbols.items.perpendicularity.name",
    symbol: "⟂",
    description:
        "Tolerancja prostopadłości - strefa ograniczona równoległymi płaszczyznami, proste prostopadłe do bazy.",
    category: SymbolCategory.orientation,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/perpendicularity.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.angularity.name",
    symbol: "∠",
    description:
        "Tolerancja nachylenia - strefa ograniczona dwiema płaszczyznami pod kątem wartości nominalnej.",
    category: SymbolCategory.orientation,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/angularity.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.parallelism.name",
    symbol: "∥",
    description:
        "Tolerancja równoległości - strefa ograniczona równoległymi płaszczyznami względem bazy.",
    category: SymbolCategory.orientation,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/parallelism.png",
  ),

  // Location Tolerances
  GdSymbol(
    name: "gd_symbols.items.position.name",
    symbol: "⌖",
    description:
        "Tolerancja pozycji - strefa ograniczona walcem o średnicy wartości tolerancji, środek w punkcie nominalnym.",
    category: SymbolCategory.location,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/position.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.concentricity.name",
    symbol: "◎",
    description:
        "Tolerancja współosiowości - strefa ograniczona walcem, oś symetrii pokrywa się z nominalną wartością.",
    category: SymbolCategory.location,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/concentricity.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.symmetry.name",
    symbol: "⌯",
    description:
        "Tolerancja symetrii - strefa ograniczona równoległymi płaszczyznami symetrycznymi do bazy.",
    category: SymbolCategory.location,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/symmetry.png",
  ),

  // Runout Tolerances
  GdSymbol(
    name: "gd_symbols.items.circular_runout.name",
    symbol: "\u2197\uFE0E",
    description:
        "Tolerancja bicia promieniowego/osiowego - strefa ograniczona dwoma koncentrycznymi okręgami.",
    category: SymbolCategory.runout,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/circular_runout.png",
  ),
  GdSymbol(
    name: "gd_symbols.items.total_runout.name",
    symbol: "⌰",
    description:
        "Tolerancja bicia całkowitego - strefa ograniczona dwoma koncentrycznymi walcami.",
    category: SymbolCategory.runout,
    requiresDatum: true,
    assetImage: "assets/images/gd_t_symbols/total_runout.png",
  ),
];
