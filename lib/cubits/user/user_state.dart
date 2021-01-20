part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState([List props = const []]);
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final ListUserModel listUser;

  const UserLoaded({@required this.listUser}):assert(listUser != null);

  @override
  List<Object> get props => [listUser];
}

class UserError extends UserState {
  final String error;

  const UserError({this.error});
}
