import 'dart:io';

void main() {
  const assetsFolder = 'assets';
  const outputFile = 'lib/generated_assets.dart';

  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE - DO NOT MODIFY');
  buffer.writeln('class GeneratedAssets {');
  buffer.writeln('  static const List<String> images = [');

  final directory = Directory(assetsFolder);
  if (!directory.existsSync()) {
    print('Error: $assetsFolder folder does not exist.');
    return;
  }

  final files = directory.listSync(recursive: true);
  for (final file in files) {
    if (file is File && (file.path.endsWith('.png') || file.path.endsWith('.jpg'))) {
      final relativePath = file.path.replaceAll('\\', '/'); // Normalize paths for Flutter
      buffer.writeln("    '$relativePath',");
    }
  }

  buffer.writeln('  ];');
  buffer.writeln('}');

  File(outputFile).writeAsStringSync(buffer.toString());
  print('Generated $outputFile with ${files.length} assets.');
}