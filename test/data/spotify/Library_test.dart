import 'package:flutter_test/flutter_test.dart';
import 'package:tastebooster/data/spotify/Library.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';

const AUTH_TOKEN =
    "BQAt97csorcV7xtGAyA1lht_GR4SZSfG9GPHiL5Hw1dHzoRe_8px3vTn9KcHFSDhHYJRALBWqElfw4oJU-P3wvH57pgny7KNiowXPZzebqg8k65EWyW0qTDgr9NZG3jKIsx_P7z_hVKmx8OqcNP0oJ6npRljJNrloU8w1vJjNd5P3vpXBQEhEdD2qBjoDfpWavHvZudnvWSggVX8o3Qb24Jr-JRfJNTT6-jowMIe4AlWVyl1AZM9MQi5nNCN_nO9KuxGokvIC1t_nuvG1yE";

void main() {
  test('Get user\'s saved albums', () async {
    var result =
        await Library.getCurrentUsersSavedAlbums(accessToken: AUTH_TOKEN);
    expectLater(result, isA<PagingObject>());
  });

  test('Get user\'s saved tracks', () async {
    var result =
        await Library.getCurrentUsersSavedTracks(accessToken: AUTH_TOKEN);
    expectLater(result, isA<PagingObject>());
  });

  test('Add tracks to user\'s library', () async {
    var result = await Library.saveTracksForUser(
        accessToken: AUTH_TOKEN, trackIDs: ['1l5xKG368GMeBYeXbYFSch']);
    expectLater(result, 200);
    print(result);
  });
}
