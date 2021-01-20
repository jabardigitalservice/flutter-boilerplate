import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/constants/dimens.dart';
import 'package:flutter_boilerplate/constants/strings.dart';
import 'package:flutter_boilerplate/cubits/user/user_cubit.dart';
import 'package:flutter_boilerplate/models/user/user_model.dart';
import 'package:flutter_boilerplate/repositories/user/user_repository.dart';
import 'package:flutter_boilerplate/screens/home/home_detail_screen.dart';
import 'package:flutter_boilerplate/widgets/open_container_wrapper.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepository())..loadListUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.userScreen),
        ),
        body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          if (state is UserLoaded) {
            return _buildListUser(state.listUser.data);
          } else if (state is UserError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  ListView _buildListUser(List<UserModel> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return OpenContainerWrapper(const HomeDetailScreen(),
              transitionType: ContainerTransitionType.fade,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: data[index].avatar,
                width: Dimens.avatar_thumbnail_size,
                height: Dimens.avatar_thumbnail_size,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.avatar_thumbnail_size / 2),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              title: Text(data[index].firstName + ' ' + data[index].lastName),
              subtitle: Text(data[index].email),
              onTap: openContainer,
            );
          });
        });
  }
}
