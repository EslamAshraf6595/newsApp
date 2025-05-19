import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  final Function(String) onSelectLanguage;

  LanguageBottomSheet({required this.onSelectLanguage});

  final Map<String, String> languages = {
    'ar': 'Arabic',
    'de': 'German',
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'he': 'Hebrew',
    'it': 'Italian',
    'nl': 'Dutch',
    'no': 'Norwegian',
    'pt': 'Portuguese',
    'ru': 'Russian',
    'sv': 'Swedish',
    'ur': 'Urdu',
    'zh': 'Chinese',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 400,
      child: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          String code = languages.keys.elementAt(index);
          String name = languages[code]!;
          return ListTile(
            leading: const Icon(Icons.language),
            title: Text(name),
            subtitle: Text(code),
            onTap: () {
              onSelectLanguage(code);
              Navigator.pop(context); // close bottom sheet
            },
          );
        },
      ),
    );
  }
}
