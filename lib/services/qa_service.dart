import 'dart:convert';
import 'package:http/http.dart' as http;

class QAService {
  static const String backendEndpoint = 'https://your-backend.example.com/ask';
  static Future<String> ask(String question) async {
    if (question.trim().isEmpty) return 'Please type your question.';
    try {
      final r = await http.post(Uri.parse(backendEndpoint),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'question': question}));
      if (r.statusCode == 200) {
        final j = json.decode(r.body);
        return j['answer']?.toString() ?? 'No answer provided by backend.';
      }
      return 'Error from backend: ${r.statusCode}';
    } catch (e) {
      return 'Network error: $e';
    }
  }
}
