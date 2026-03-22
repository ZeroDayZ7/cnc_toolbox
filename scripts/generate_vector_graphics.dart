// scripts/generate_vector_graphics.dart
// dart run scripts/generate_vector_graphics.dart
// ignore_for_file: avoid_print
import 'dart:io';

import 'package:path/path.dart' as p;

void main() async {
  // Ścieżka wejściowa (Twoje SVG)
  final String inputPath = p.join('assets', 'images', 'gd_t_symbols', 'svg');
  final Directory inputDir = Directory(inputPath);

  if (!await inputDir.exists()) {
    print('❌ Błąd: Folder wejściowy nie istnieje: $inputPath');
    return;
  }

  // Pobierz wszystkie pliki .svg
  final List<FileSystemEntity> files = inputDir
      .listSync()
      .where((file) => file.path.endsWith('.svg'))
      .toList();

  if (files.isEmpty) {
    print('ℹ️ Nie znaleziono plików .svg w $inputPath');
    return;
  }

  print('🚀 Start generowania ${files.length} plików wektorowych...');

  int successCount = 0;

  for (var file in files) {
    final String fileName = p.basenameWithoutExtension(file.path);
    final String outputPath = p.join(inputDir.path, '$fileName.vec');

    final result = Process.runSync('dart', [
      'run',
      'vector_graphics_compiler',
      '-i',
      file.path,
      '-o',
      outputPath,
    ], runInShell: true);

    if (result.exitCode == 0) {
      print('✅ Wygenerowano: $fileName.vec');
      successCount++;
    } else {
      print('❌ Błąd przy pliku $fileName:');
      print(result.stderr);
    }
  }

  print('---');
  if (successCount == files.length) {
    print(
      '🎉 Wszystkie pliki ($successCount) zostały pomyślnie zoptymalizowane.',
    );
  } else {
    print('⚠️ Zakończono z błędami. Sukces: $successCount/${files.length}');
  }
}
