import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/screens/authenticate/authenticate.dart';
import 'package:brew_crew_app/screens/authenticate/sign_in.dart';
import 'package:brew_crew_app/screens/home/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
    // return Authentication();
  }
}
