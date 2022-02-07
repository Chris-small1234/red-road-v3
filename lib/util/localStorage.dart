import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LocalStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/quotes.txt');
  }

  Future<File> writeContent(String quote) async {
    final file = await _localFile;
    return file.writeAsString(quote);
  }

  Future<String?> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String readQuote = await file.readAsString();
      return readQuote;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
