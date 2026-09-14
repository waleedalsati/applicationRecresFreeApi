part of 'prodectcubit_cubit.dart';


abstract class ProdectcubitState {}

final class ProdectcubitInitial extends ProdectcubitState {}
final class ProdectcubitLoading extends ProdectcubitState {}

final class ProdectcubitSucses extends ProdectcubitState {
List<Recordotem>data;

  ProdectcubitSucses(this.data);
}


final class Prodectcubitfail extends ProdectcubitState {

  String error ;
  Prodectcubitfail(this.error);
}