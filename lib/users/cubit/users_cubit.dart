import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trainingapp/users/data/model/UsersResponse.dart';

import '../data/repo/usersRepo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  userRepo repo;

  UsersCubit(this.repo) : super(UsersInitial());
  void getallusers()async{
    emit(UsersLoding());
    try{
      final info = await repo.getallUsers();
      emit(UsersSucces(info.data));

  }catch(e) {

      emit(Usersfail(e.toString()));
    }



  }
}
