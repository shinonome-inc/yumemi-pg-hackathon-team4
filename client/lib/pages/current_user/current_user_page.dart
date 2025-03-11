import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUserPage extends ConsumerStatefulWidget {
  const CurrentUserPage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<CurrentUserPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
