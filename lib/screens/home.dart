import 'package:flutter/material.dart';
import '../config/theme_manager.dart';
import '../services/qa_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _answer = '';
  bool _loading = false;
  bool _dark = false;

  Future<void> _ask() async {
    setState(() => _loading = true);
    final a = await QAService.ask(_controller.text);
    setState(() {
      _answer = a;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _dark ? AppTheme.dark() : AppTheme.light(),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MEP Dubai Q&A', style: TextStyle(fontWeight: FontWeight.w700)),
          actions: [
            IconButton(onPressed: () => setState(()=>_dark=!_dark), icon: const Icon(Icons.color_lens_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const Text('Ask about DEWA & Dubai Codes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(controller: _controller, minLines: 1, maxLines: 3, decoration: const InputDecoration(hintText: 'Example: DEWA earthing for LV risers')),
                const SizedBox(height: 8),
                ElevatedButton.icon(onPressed: _loading?null:_ask, icon: _loading?const SizedBox(width:18,height:18,child:CircularProgressIndicator(strokeWidth:2)):const Icon(Icons.search), label: Text(_loading?'Searching…':'Ask'))
              ]),
            )),
            const SizedBox(height: 12),
            Expanded(child: Card(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(child: SelectableText(_answer.isEmpty ? 'Your answer will appear here.' : _answer)),
            ))),
          ]),
        ),
      ),
    );
  }
}
