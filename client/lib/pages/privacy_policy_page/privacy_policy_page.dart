import 'package:client/components/app_content_view.dart';
import 'package:client/enums/app_contents_type.dart';
import 'package:client/extensions/app_content_extension.dart';
import 'package:client/repository/firestore_repository.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _privacyPolicyText = '';

  @override
  void initState() {
    super.initState();
    Future(() async {
      final content = await FirestoreRepository.instance.getAppContentByType(
        AppContentType.privacyPolicy,
      );
      setState(() {
        _privacyPolicyText = content.displayText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
      body: SafeArea(
        child: AppContentView(contentText: _privacyPolicyText),
      ),
    );
  }
}
