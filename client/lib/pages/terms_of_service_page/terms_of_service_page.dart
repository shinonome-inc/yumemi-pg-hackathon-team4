import 'package:client/components/app_content_view.dart';
import 'package:client/enums/app_contents_type.dart';
import 'package:client/extensions/app_content_extension.dart';
import 'package:client/repository/firestore_repository.dart';
import 'package:flutter/material.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({super.key});

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  String _termsOfServiceText = '';

  @override
  void initState() {
    super.initState();
    Future(() async {
      final content = await FirestoreRepository.instance.getAppContentByType(
        AppContentType.termsOfService,
      );
      setState(() {
        _termsOfServiceText = content.displayText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('利用規約'),
      ),
      body: SafeArea(
        child: AppContentView(contentText: _termsOfServiceText),
      ),
    );
  }
}
