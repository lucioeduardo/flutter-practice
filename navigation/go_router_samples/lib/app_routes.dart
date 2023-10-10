import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_app/pages/about/about_inner_page.dart';
import 'package:router_app/pages/bottom_navigation/main_view_page.dart';
import 'package:router_app/pages/bottom_navigation/section_details_page.dart';
import 'package:router_app/pages/bottom_navigation/section_page.dart';
import 'package:router_app/pages/home/home_page.dart';

import 'pages/about/about_page.dart';

final _rootKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootKey,
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainViewPage(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: 'a',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: SectionPage(pageTitle: 'A', detailsPagePath: '/a/details')),
                    routes: [
                      GoRoute(
                        name: 'detailsA',
                        path: 'details/:id',
                        builder: (context, state) {
                          return const SectionDetailsPage(
                            label: 'A',
                          );
                        },
                      ),
                    ]),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: 'b',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: SectionPage(pageTitle: 'B', detailsPagePath: '/b/details')),
                    routes: [
                      GoRoute(
                        path: 'details/:id',
                        builder: (context, state) => const SectionDetailsPage(label: 'B'),
                      ),
                    ]),
              ],
            )
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootKey,
      path: '/about',
      builder: (context, state) => const AboutPage(),
      routes: [
        GoRoute(
          parentNavigatorKey: _rootKey,
          path: 'inner',
          builder: (context, state) => const AboutInnerPage(),
        )
      ],
    )
  ],
);
