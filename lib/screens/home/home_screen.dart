import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/environment_config.dart';
import 'package:flutter_boilerplate/screens/home/home_detail_screen.dart';
import 'package:flutter_boilerplate/screens/user/user_list_screen.dart';

const double _fabDimension = 56.0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: Center(
        child: Text('BASE_URL = ${EnvironmentConfig.BASE_URL}'),
      ),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        transitionDuration: const Duration(milliseconds: 700),
        openBuilder: (BuildContext context, VoidCallback _) {
          return UserListScreen();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.people,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}
