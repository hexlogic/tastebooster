import 'package:flutter_test/flutter_test.dart';
import 'package:tastebooster/data/spotify/Search.dart';
import 'package:tastebooster/data/spotify/models/SearchObject.dart';

const AUTH_TOKEN =
    "BQCHsjnw-09tASzK6OP9dUczOakn63MpZv4Xc05qRVcPphhswm93dMoyL0veGP_4u2YOM-HcDrAbiMUM21FdxnWym0Y4Pq9Lz5hCvHDQVJY5NhbU-lF8erNKiH-MDoQn9i0DU-DND7M4tTTAwaJiEqvhQVzCiWOx_ZGDT44uy7q_rHdu9EZOmSk0c-yjmPHQWZcwrBW7mdMtPgD55c46PA5XcDpzxra7In7jmJZ7m57xE6E84fi1kAYg7VvbBxbjHE92YZtO2_NLd5XbG-s";

void main() {
  test('Search test for hexlogic', () async {
    var searchResults = await Search.search(
        accessToken: AUTH_TOKEN,
        query: 'hexlogic',
        type: ['artist', 'track', 'album', 'playlist']);
    expectLater(searchResults, isA<SearchObject>());
  });
}
