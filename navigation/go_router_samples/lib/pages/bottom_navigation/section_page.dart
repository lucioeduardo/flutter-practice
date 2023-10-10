// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionPage extends StatelessWidget {
  final String pageTitle;
  final String detailsPagePath;

  const SectionPage({
    Key? key,
    required this.pageTitle,
    required this.detailsPagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("My Root Page $pageTitle"),
        ElevatedButton(
            onPressed: () {
              context.push(Uri(path: "$detailsPagePath/5", queryParameters: {'teste': '1'}).toString());
            },
            child: const Text('Ver detalhes')),
      ],
    );
  }
}
