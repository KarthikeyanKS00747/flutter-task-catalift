import 'package:catalift_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
  )
]);
