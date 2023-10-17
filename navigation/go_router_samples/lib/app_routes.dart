import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_app/pages/about/about_inner_page.dart';
import 'package:router_app/pages/custom_scaffold/custom_scaffold.dart';
import 'package:router_app/pages/home/home_page.dart';
import 'package:router_app/pages/section/section_details_page.dart';
import 'package:router_app/pages/section/section_page.dart';

import 'pages/about/about_page.dart';
import 'pages/custom_scaffold/custom_scaffold_stateless.dart';

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
            return CustomScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: 'statefulStack/a',
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: SectionPage(pageTitle: 'A', detailsPagePath: '/statefulStack/a/details')),
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
                    path: 'statefulStack/b',
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: SectionPage(pageTitle: 'B', detailsPagePath: '/statefulStack/b/details')),
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
        StatefulShellRoute(
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: 'stateful/a',
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: SectionPage(pageTitle: 'A', detailsPagePath: '/stateful/a/details')),
                    routes: [
                      GoRoute(
                        path: 'details/:id',
                        builder: (context, state) => const SectionDetailsPage(label: 'A'),
                      ),
                    ]),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: 'stateful/b',
                    pageBuilder: (context, state) => const NoTransitionPage(
                        child: SectionPage(pageTitle: 'B', detailsPagePath: '/stateful/b/details')),
                    routes: [
                      GoRoute(
                        path: 'details/:id',
                        builder: (context, state) => const SectionDetailsPage(label: 'B'),
                      ),
                    ]),
              ],
            )
          ],
          navigatorContainerBuilder: (context, navigationShell, children) {
            return children[navigationShell.currentIndex];
          },
          builder: (context, state, navigationShell) {
            return CustomScaffold(navigationShell: navigationShell);
          },
        ),
        ShellRoute(
            builder: (context, state, child) {
              return CustomScaffoldPageStateless(
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: 'shell/a',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SectionPage(pageTitle: 'A', detailsPagePath: '/shell/a/details')),
                routes: [
                  GoRoute(
                    path: 'details/:id',
                    builder: (context, state) => const SectionDetailsPage(label: 'A'),
                  ),
                ],
              ),
              GoRoute(
                  path: 'shell/b',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: SectionPage(pageTitle: 'B', detailsPagePath: '/shell/b/details')),
                  routes: [
                    GoRoute(
                      path: 'details/:id',
                      builder: (context, state) => const SectionDetailsPage(label: 'B'),
                    ),
                  ]),
            ]),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootKey,
      name: 'aboutPage',
      path: '/about',
      builder: (context, state) => const AboutPage(),
      routes: [
        GoRoute(
          parentNavigatorKey: _rootKey,
          path: 'inner',
          builder: (context, state) => const AboutDetailsPage(),
        )
      ],
    )
  ],
);
