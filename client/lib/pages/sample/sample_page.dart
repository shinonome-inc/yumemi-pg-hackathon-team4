import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SamplePage extends ConsumerStatefulWidget {
  const SamplePage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
