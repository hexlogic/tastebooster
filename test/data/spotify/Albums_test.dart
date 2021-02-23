import 'package:flutter_test/flutter_test.dart';
import 'package:tastebooster/data/spotify/Albums.dart';
import 'package:tastebooster/data/spotify/models/AlbumObject.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';

const AUTH_TOKEN =
    "BQDWbMy3easki67nO8EBGxqZNFGgFN-oJvGyThNgimfkY8_KCChIHKTGvueufn5gxergsnpEq8ziTwvZpwHeT_lKKE8wxkA6tNbVOf3frN9Grd4RSsYhsXzLgwVuR_QW7iDCvY8LAOv7TSy7unqymD7B4O8PJDQPpqtZzzgY5zFxWdm6WUJqJp7-ikOG2k7fZuhFiiZBYOdZhFP6n6o8eInRELvo4cfPk9p5Eyp1m2bjij41La0zYnKcYBNMqyugOCoiv88GJb2dapeFwtk";

void main() {
  test('Get An Album\'s tracks', () async {
    var tracks = await Albums.getAnAlbumsTracks(
        accessToken: AUTH_TOKEN, albumID: '02VberDzIjmGETtcUwane0');
    expectLater(tracks, isA<PagingObject>());
  });

  test('Get an Album', () async {
    var album = await Albums.getAnAlbum(
        accessToken: AUTH_TOKEN, albumID: '2a5aY3I4sCBWYY1WkmK9We');
    expectLater(album, isA<AlbumObject>());
  });

}
