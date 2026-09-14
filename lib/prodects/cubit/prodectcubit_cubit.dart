import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trainingapp/prodects/data/modelProdect.dart';
import '../data/prodictRepo.dart';

part 'prodectcubit_state.dart';

class ProdectcubitCubit extends Cubit<ProdectcubitState> {
  final prodictrepo repo;

  ProdectcubitCubit(this.repo) : super(ProdectcubitInitial());

  void getallprodect11() async {

    emit(ProdectcubitLoading());

    try {

      final data = await repo.getallprodect();

      emit(ProdectcubitSucses(data .data));
    } catch (error) {

      emit(Prodectcubitfail(error.toString()));
    }
  }
}