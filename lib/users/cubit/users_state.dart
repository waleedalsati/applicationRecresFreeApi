part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}
final class UsersLoding  extends UsersState {}
final class UsersSucces  extends UsersState {
  List<Informationuser>users;
  UsersSucces(this.users);

}
final class Usersfail extends UsersState {

  String message;
  Usersfail(this.message);
}
