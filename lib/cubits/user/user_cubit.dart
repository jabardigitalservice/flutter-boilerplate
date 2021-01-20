import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/models/user/user_model.dart';
import 'package:flutter_boilerplate/repositories/user/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  void loadListUser() async {
    emit(UserLoading());
    try {
      ListUserModel listUser = await _userRepository.getUsers();
      emit(UserLoaded(listUser: listUser));
    } catch (e) {
      emit(UserError(error: e));
    }
  }
}
