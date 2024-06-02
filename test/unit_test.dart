import 'dart:convert';

import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/infrastructure/repository/cat_repository/cat_repository_http.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/presentation/home/screen/home_screen.dart';
import 'package:cat_breeds/presentation/home/widget/cat_item_widget.dart';
import 'package:cat_breeds/utils/api/api.dart';
import 'package:cat_breeds/utils/widget/no_record_found/no_record_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cat_breeds/main.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

void main() {
  group('Unit test', () {
    test('Get api URLs', () async{
      final apiBaseURL = Api.getAPIBase();

      expect(apiBaseURL, isNotEmpty);
      expect(apiBaseURL, 'api.thecatapi.com');
    });
  });
}
