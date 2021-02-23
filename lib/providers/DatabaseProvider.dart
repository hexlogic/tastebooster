// database table and column names
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableLikedTracks = 'likedTracks';
final String tableBlockedTracks = 'blockedTracks';
final String columnId = '_id';
final String columnTrackId = 'trackId';
final String columnUserId = 'userId';

// data model class
class UserTrack {
  int id;
  String trackId;
  String userId;

  UserTrack();

  // convenience constructor to create a Word object
  UserTrack.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    trackId = map[columnTrackId];
    userId = map[columnUserId];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnTrackId: trackId, columnUserId: userId};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "UserTracks.db";
  // TODO: Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableLikedTracks (
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnTrackId TEXT NOT NULL,
                $columnUserId TEXT NOT NULL
              )
              ''');
    await db.execute('''
              CREATE TABLE $tableBlockedTracks (
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnTrackId TEXT NOT NULL,
                $columnUserId TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insertLikedTrack(UserTrack track) async {
    Database db = await database;
    int id = await db.insert(tableLikedTracks, track.toMap());
    return id;
  }

  Future<int> insertBlockedTrack(UserTrack track) async {
    Database db = await database;
    int id = await db.insert(tableBlockedTracks, track.toMap());
    return id;
  }

  Future<List<UserTrack>> queryAllBlockedTrack(String userID) async {
    Database db = await database;
    List<Map> maps = await db.query(tableBlockedTracks,
        columns: [columnId, columnUserId, columnTrackId],
        where: '$columnUserId = ?',
        whereArgs: [userID]);
    if (maps.length > 0) {
      List<UserTrack> tracks = [];
      maps.forEach((element) {
        tracks.add(UserTrack.fromMap(element));
      });
      return tracks;
    }
    return null;
  }

  Future<List<UserTrack>> queryAllLikedTrack(String userID) async {
    Database db = await database;
    List<Map> maps = await db.query(tableLikedTracks,
        columns: [columnId, columnUserId, columnTrackId],
        where: '$columnUserId = ?',
        whereArgs: [userID]);
    if (maps.length > 0) {
      List<UserTrack> tracks = [];
      maps.forEach((element) {
        tracks.add(UserTrack.fromMap(element));
      });
      return tracks;
    }
    return null;
  }
}
