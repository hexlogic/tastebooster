import 'package:flutter_test/flutter_test.dart';
import 'package:tastebooster/data/spotify/UsersProfile.dart';
import 'package:tastebooster/data/spotify/models/UserObject.dart';

const AUTH_TOKEN =
    "BQDPdPeXqzmc9XiIwZoVbTDwZTSVj8R6wCMrwQZswXU7WsTFmWXQktPFiSmnAPIYKAMgJ-R8G7u_jd7AZydx2ZHdm4NDCJFRmi4NpFUWBsR-R3xKHTOkTxPdT6RLHcqhxglrXQ1iWZTNvXLdwjdZtoO3GoNTke7rvaXaF80mI8rhg-DlM6dPw4m2u2FWu53R-F7EgtWXE3QBKCKTPdVVHW6twO6K8q56wLrfKZcNw48PXGeiND8FseSDxz__EU-8wVNKYKk81zifysrRR7Q";

void main() {
  test("Get Current User\'s profile", () async {
    var usersProfile =
        await UsersProfile.getCurrentUsersProfile(accessToken: AUTH_TOKEN);
    expectLater(usersProfile, isA<PrivateUserObject>());
  });

  test("Get A User\'s profile", () async {
    var userProfile = await UsersProfile.getAUsersProfile(
        accessToken: AUTH_TOKEN, userID: "11z989xmev3p1mzrihd7wiwad");
    expectLater(userProfile, isA<PublicUserObject>());
  });
}
